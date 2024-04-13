import http from 'node:http'
import path from 'node:path'
import fs from 'node:fs/promises'
import { createConnection } from 'mysql2'
import { obtenerUsuarios, exportarUsuariosCSV, importarUsuariosCSV, obtenerUsuariosImportados } from './functions.mjs'

// Crear conexión a la base de datos MySQL
const db = createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'api'
})

// Función para manejar las solicitudes HTTP
const server = http.createServer(async (req, res) => {
  let filePath
  let contentType = 'text/html' // Tipo de contenido predeterminado

  if (req.url === '/') {
    filePath = path.resolve('./public/home.html')
  } else if (req.url === '/api/usuarios') {
    // Manejar la solicitud para /api/usuarios
    try {
      const usuarios = await obtenerUsuarios()
      res.writeHead(200, { 'Content-Type': 'application/json' })
      res.end(JSON.stringify(usuarios))
      return // Finaliza la ejecución para evitar enviar otro archivo
    } catch (error) {
      res.writeHead(500, { 'Content-Type': 'application/json' })
      res.end(JSON.stringify({ error: 'Error al obtener usuarios de la base de datos' }))
      return
    }
  } else if (req.url === '/api/usuarios/export') {
    // Manejar la solicitud para /api/usuarios/export
    try {
      const mensaje = await exportarUsuariosCSV()
      // Configurar la respuesta para mostrar el mensaje en negrita y más grande
      const mensajeHTML = `<h1 style="font-size: 24px; font-weight: bold;">${mensaje}</h1>`
      res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' })
      res.end(mensajeHTML)
    } catch (error) {
      console.error('Error al exportar usuarios:', error)
      res.writeHead(500, { 'Content-Type': 'application/json' })
      res.end(JSON.stringify({ error: 'Error al exportar usuarios' }))
    }
    return // Finaliza la ejecución para evitar enviar otro archivo
  } else if (req.url === '/api/usuarios/import') {
    // Manejar la solicitud para /api/usuarios/import
    try {
      await importarUsuariosCSV()
      const usuariosImportados = await obtenerUsuariosImportados()
      res.writeHead(200, { 'Content-Type': 'application/json' })
      res.end(JSON.stringify({ message: 'Usuarios importados correctamente', usuarios: usuariosImportados }))
    } catch (error) {
      console.error('Error al importar usuarios:', error)
      res.writeHead(500, { 'Content-Type': 'application/json' })
      res.end(JSON.stringify({ error: 'Error al importar usuarios' }))
    }
    return
  } else if (req.url === '/usuarios-importados') {
    // Manejar la solicitud para /usuarios-importados
    try {
      const usuariosImportados = await obtenerUsuariosImportados()
      const respuestaHTML = `<h1>Usuarios importados:</h1><pre>${JSON.stringify(usuariosImportados, null, 2)}</pre>`
      res.writeHead(200, { 'Content-Type': 'text/html' })
      res.end(respuestaHTML)
    } catch (error) {
      console.error('Error al obtener usuarios importados:', error)
      res.writeHead(500, { 'Content-Type': 'text/plain' })
      res.end('Error al obtener usuarios importados')
    }
    return
  } else {
    filePath = path.resolve(`./public${req.url}`)
    if (req.url.endsWith('.css')) {
      contentType = 'text/css' // Cambiar el tipo de contenido si la solicitud es para un archivo CSS
    }
  }

  try {
    const fileContent = await fs.readFile(filePath, 'utf-8')
    res.writeHead(200, { 'Content-Type': contentType })
    res.end(fileContent)
  } catch (error) {
    res.writeHead(404, { 'Content-Type': 'text/plain' })
    res.end('File not found')
  }
})

// Conectar a la base de datos y iniciar el servidor HTTP
db.connect((err) => {
  if (err) {
    console.error('Error al conectar a la base de datos:', err)
    return
  }
  console.log('Conexión exitosa a la base de datos MySQL')
  server.listen(3000, () => {
    console.log('Servidor en ejecución en http://localhost:3000')
  })
})
