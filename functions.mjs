import db from './db.mjs'
import { createObjectCsvWriter } from 'csv-writer'

// Función para obtener la lista de usuarios desde la base de datos MySQL
export const obtenerUsuarios = () => {
  return new Promise((resolve, reject) => {
    db.query('SELECT * FROM usuarios', (err, results) => {
      if (err) {
        reject(err)
      } else {
        resolve(results)
      }
    })
  })
}

// Función para exportar usuarios a CSV
export const exportarUsuariosCSV = async () => {
  try {
    const usuarios = await obtenerUsuarios()
    const csvWriter = createObjectCsvWriter({
      path: 'usuarios.csv',
      header: [
        { id: 'id', title: 'ID' },
        { id: 'nombres', title: 'Nombres' },
        { id: 'apellidos', title: 'Apellidos' },
        { id: 'direccion', title: 'Dirección' },
        { id: 'correo', title: 'Correo' },
        { id: 'dni', title: 'DNI' },
        { id: 'edad', title: 'Edad' },
        { id: 'fecha_creacion', title: 'Fecha de Creación' },
        { id: 'telefono', title: 'Teléfono' }
      ]
    })
    await csvWriter.writeRecords(usuarios)
    console.log('Usuarios exportados a usuarios.csv correctamente')
    return 'Exportación realizada correctamente'
  } catch (error) {
    console.error('Error al exportar usuarios a CSV:', error)
    throw error
  }
}

// Función para importar usuarios desde CSV
export const importarUsuariosCSV = async () => {
  try {
    // Tu lógica de importación de usuarios desde CSV aquí
  } catch (error) {
    console.error('Error al importar usuarios desde CSV:', error)
    throw error
  }
}

// Función para obtener los usuarios importados desde la base de datos
export const obtenerUsuariosImportados = () => {
  return new Promise((resolve, reject) => {
    db.query('SELECT * FROM usuarios', (err, results) => {
      if (err) {
        reject(err)
      } else {
        resolve(results)
      }
    })
  })
}
