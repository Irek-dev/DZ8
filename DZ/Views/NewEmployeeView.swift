import SwiftUI

struct NewEmployeeView: View {
    // Свойства для хранения введённых данных
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var middleName: String = ""
    @State private var age: String = ""
    @State private var birthDate: String = ""
    @State private var address: String = ""
    @State private var phoneNumber: String = ""
    @State private var email: String = ""
    @State private var position: String = ""

    var body: some View {
        VStack(spacing: 0) {
            Text("Новый сотрудник")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.vertical, 20)

            ScrollView {
                VStack(spacing: 15) {
                    InputFieldView(placeholder: "Имя", text: $firstName)
                    InputFieldView(placeholder: "Фамилия", text: $lastName)
                    InputFieldView(placeholder: "Отчество", text: $middleName)
                    InputFieldView(placeholder: "Возраст", text: $age)
                    InputFieldView(placeholder: "Дата рождения", text: $birthDate)
                    InputFieldView(placeholder: "Адрес проживания", text: $address)
                    InputFieldView(placeholder: "Контактный номер телефона", text: $phoneNumber)
                    InputFieldView(placeholder: "Электронная почта", text: $email)
                    InputFieldView(placeholder: "Должность", text: $position)
                }
                .padding(.horizontal, 16)
            }

            // Кнопка "Добавить"
            Button(action: {
                // Пока ничего не делает
                print("Добавить сотрудника")
            }) {
                Text("Добавить")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal, 16)
            }
            .padding(.bottom, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}

// Компонент для текстовых полей
struct InputFieldView: View {
    var placeholder: String
    @Binding var text: String

    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
            .padding(.horizontal, 16)
    }
}
