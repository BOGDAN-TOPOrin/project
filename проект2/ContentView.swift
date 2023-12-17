import SwiftUI

struct ContentView: View {
    // Массив для хранения задач
    @State private var tasks: [String] = []

    // Переменная для хранения текста новой задачи
    @State private var newTask: String = ""

    var body: some View {
        // Определение основного вида приложения внутри NavigationView
        NavigationView {
            VStack {
                // Вид списка (List) для отображения задач
                List {
                    // Итерация по массиву задач для создания текстовых представлений
                    ForEach(tasks, id: \.self) { task in
                        Text(task)
                    }
                    // Возможность удаления задачи свайпом
                    .onDelete(perform: deleteTask)
                }

                // Вид для ввода новой задачи и кнопки для ее добавления
                HStack {
                    // TextField для ввода новой задачи
                    TextField("New Task", text: $newTask)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    // Кнопка для добавления задачи
                    Button(action: addTask) {
                        Text("Add")
                    }
                }
                .padding()
            }
            // Заголовок навигационной панели
            .navigationTitle("To-Do List")
        }
    }

    // Функция для добавления новой задачи в массив
    func addTask() {
        if !newTask.isEmpty {
            tasks.append(newTask)
            newTask = ""
        }
    }

    // Функция для удаления задачи из массива по индексу
    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    // Вид предварительного просмотра
    static var previews: some View {
        ContentView()
    }
}
