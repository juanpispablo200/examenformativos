task.dart

Este archivo define la clase Task, que representa una tarea con un título, una descripción y un estado de completado. Tiene un constructor que requiere un título y una descripción, y el estado de completado es opcional, por defecto se establece como falso.
providers/taskProvider.dart

Aquí se encuentra la clase TaskProvider, que extiende ChangeNotifier. Esta clase gestiona la lista de tareas, proporcionando métodos para agregar, actualizar y eliminar tareas. Cuando se realiza alguna de estas operaciones, se notifica a los escuchadores (en este caso, los widgets que consumen esta clase).

pantalla/taskListScreen.dart

Este archivo define la pantalla principal (TaskListScreen) que muestra la lista de tareas. Utiliza Consumer<TaskProvider> para escuchar los cambios en la lista de tareas y actualizar la interfaz de usuario en consecuencia. Se utiliza un ListView.builder para mostrar cada tarea con opciones para marcarla como completada, eliminarla o editarla.
pantalla/taskCreateScreen.dart

Este archivo define la pantalla para agregar o editar una tarea (AddEditTaskScreen). Dependiendo de si se proporciona una tarea existente, la pantalla mostrará un formulario para agregar una nueva tarea o para editar la tarea existente. La información se recopila mediante controladores de texto y se guarda en el TaskProvider usando Provider.of<TaskProvider>(context, listen: false).![Captura de pantalla 2024-02-01 191722](https://github.com/juanpispablo200/examenformativos/assets/116582110/64bf188e-c08c-4822-9f34-57172cb2fac0)
![Uploading Captura de pantalla 2024-02-01 191722.png…]()
![Captura de pantalla 2024-02-01 191816](https://github.com/juanpispablo200/examenformativos/assets/116582110/2231ffa3-7847-46c4-af63-2a5f3b8e280c)
