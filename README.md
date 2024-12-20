# EyeBreak

**EyeBreak** is a simple and effective tool designed to help developers and anyone who spends long hours in front of a monitor maintain healthier vision. By providing timely reminders to take short breaks, EyeBreak helps prevent eye strain and reduces the risk of visual fatigue.

## 🌟 Features

- **Periodic Reminders:** Displays a notification every 20 minutes, prompting you to look away from the screen.
- **Customizable Notifications:** Friendly and engaging messages encourage you to take a 20-second break.
- **Easy Installation:** A simple installation script automates setup, including necessary dependencies and cron jobs.
- **Lightweight & Efficient:** Minimal resource usage ensures no interruption to your workflow.
- **Open Source:** Available on GitHub for transparency and community-driven improvements.

## 📦 Installation

Follow these steps to install and set up EyeBreak on your Linux system:

1. **Clone the Repository:**
    ```bash
    git clone https://github.com/mohammadrasoulasghari/eye-break.git
    cd eye-break
    ```

2. **Make the Install Script Executable:**
    ```bash
    chmod +x install.sh
    ```

3. **Run the Install Script with Root Privileges:**
    ```bash
    sudo ./install.sh
    ```

    The installation script will:
    - Install `zenity` if needed.
    - Copy the reminder script to `/usr/local/bin/`.
    - Set up a cron job to display the reminder every 20 minutes.

## 🛠 Usage

Once installed, EyeBreak runs in the background and displays notifications every 20 minutes, reminding you to rest your eyes. No further action is required.

### Uninstallation:

1. **Clone the Repository (if not already done):**
    ```bash
    git clone https://github.com/mohammadrasoulasghari/eye-break.git
    cd eye-break
    ```

2. **Make the Uninstall Script Executable:**
    ```bash
    chmod +x uninstall.sh
    ```

3. **Run the Uninstall Script with Root Privileges:**
    ```bash
    sudo ./uninstall.sh
    ```

    The uninstall script will:
    - Remove the corresponding cron job.
    - Delete the reminder script from `/usr/local/bin/`.

## 💡 Why EyeBreak?

Staring at a screen for extended periods can lead to eye strain, headaches, and other health issues. EyeBreak acts as a gentle reminder to:

- **Look Away:** Focus on a distant object to relax your eye muscles.
- **Blink Regularly:** Maintain eye moisture and prevent dryness.
- **Take Short Breaks:** Brief pauses significantly improve overall eye health and productivity.

## 📫 Contributing

Contributions are welcome! If you have suggestions, encounter issues, or would like to add new features, please open an issue or submit a pull request.

## 📜 License

This project is licensed under the [MIT License](LICENSE).

## 📧 Contact

For questions or feedback, feel free to reach out to [Your Name](mailto:mohammadrasoulasghari1@gmail.com).