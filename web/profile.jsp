<%-- 
    Document   : profile
    Created on : Nov 11, 2025, 1:41:08 PM
    Author     : nur azwin
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Profile Display</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        
        :root {
            --primary: #6a11cb;
            --secondary: #2575fc;
            --accent: #ff4d8d;
            --light: #f8f9fa;
            --dark: #333;
            --success: #00c853;
        }
        
        body {
            background: linear-gradient(135deg, #0f0c29, #302b63, #24243e);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
            overflow-x: hidden;
        }
        
        .floating-shapes {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            overflow: hidden;
        }
        
        .shape {
            position: absolute;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.1);
            animation: float 15s infinite linear;
        }
        
        .shape:nth-child(1) {
            width: 80px;
            height: 80px;
            top: 20%;
            left: 10%;
            animation-delay: 0s;
        }
        
        .shape:nth-child(2) {
            width: 120px;
            height: 120px;
            top: 60%;
            left: 80%;
            animation-delay: 2s;
        }
        
        .shape:nth-child(3) {
            width: 60px;
            height: 60px;
            top: 80%;
            left: 20%;
            animation-delay: 4s;
        }
        
        .shape:nth-child(4) {
            width: 100px;
            height: 100px;
            top: 30%;
            left: 85%;
            animation-delay: 6s;
        }
        
        .profile-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            padding: 50px 40px;
            border-radius: 25px;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 50%;
            transition: all 0.5s ease;
            position: relative;
            overflow: hidden;
            animation: containerAppear 1s ease-out;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        
        .profile-container::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(45deg, transparent, rgba(255,255,255,0.1), transparent);
            transform: rotate(45deg);
            animation: shine 8s infinite linear;
        }
        
        .profile-container:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: 0 30px 60px rgba(0, 0, 0, 0.4);
        }
        
        .profile-header {
            text-align: center;
            margin-bottom: 40px;
            position: relative;
        }
        
        .profile-header h2 {
            color: var(--dark);
            font-size: 2.5rem;
            margin-bottom: 15px;
            background: linear-gradient(135deg, var(--primary), var(--secondary), var(--accent));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            position: relative;
            display: inline-block;
            text-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .profile-header h2::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 4px;
            background: linear-gradient(to right, var(--primary), var(--secondary));
            border-radius: 2px;
        }
        
        .profile-header p {
            color: #666;
            font-size: 1rem;
            margin-top: 20px;
        }
        
        .profile-details {
            text-align: left;
            margin-bottom: 30px;
        }
        
        .detail-item {
            margin-bottom: 25px;
            padding: 15px 20px;
            background: rgba(248, 249, 250, 0.8);
            border-radius: 15px;
            transition: all 0.3s ease;
            border-left: 4px solid var(--primary);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }
        
        .detail-item:hover {
            transform: translateX(10px);
            background: white;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }
        
        .detail-label {
            font-weight: 600;
            color: var(--primary);
            font-size: 0.9rem;
            margin-bottom: 5px;
            display: flex;
            align-items: center;
        }
        
        .detail-label i {
            margin-right: 10px;
            font-size: 1.1rem;
        }
        
        .detail-value {
            color: #444;
            font-size: 1.1rem;
            line-height: 1.5;
        }
        
        .intro-section {
            background: rgba(248, 249, 250, 0.8);
            padding: 20px;
            border-radius: 15px;
            margin-top: 20px;
            border-left: 4px solid var(--accent);
            transition: all 0.3s ease;
        }
        
        .intro-section:hover {
            transform: translateX(10px);
            background: white;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }
        
        .intro-label {
            font-weight: 600;
            color: var(--accent);
            font-size: 1rem;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
        }
        
        .intro-label i {
            margin-right: 10px;
            font-size: 1.2rem;
        }
        
        .intro-text {
            color: #444;
            font-size: 1rem;
            line-height: 1.6;
            word-wrap: break-word;
        }
        
        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 30px;
        }
        
        .btn {
            padding: 12px 25px;
            border-radius: 10px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            font-size: 1rem;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: white;
            border: none;
            box-shadow: 0 5px 15px rgba(37, 117, 252, 0.3);
        }
        
        .btn-primary:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(37, 117, 252, 0.4);
        }
        
        .btn-secondary {
            background: rgba(255, 255, 255, 0.8);
            color: var(--dark);
            border: 2px solid var(--primary);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }
        
        .btn-secondary:hover {
            transform: translateY(-5px);
            background: white;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }
        
        .btn i {
            margin-right: 8px;
        }
        
        .glow {
            position: absolute;
            width: 300px;
            height: 300px;
            border-radius: 50%;
            background: radial-gradient(circle, rgba(106, 17, 203, 0.3) 0%, transparent 70%);
            filter: blur(20px);
            z-index: -1;
            animation: glowMove 10s infinite alternate;
        }
        
        .glow:nth-child(1) {
            top: -100px;
            left: -100px;
        }
        
        .glow:nth-child(2) {
            bottom: -100px;
            right: -100px;
            animation-delay: 2s;
        }
        
        @keyframes float {
            0% {
                transform: translateY(0) rotate(0deg);
            }
            50% {
                transform: translateY(-20px) rotate(180deg);
            }
            100% {
                transform: translateY(0) rotate(360deg);
            }
        }
        
        @keyframes shine {
            0% {
                transform: translateX(-100%) translateY(-100%) rotate(45deg);
            }
            100% {
                transform: translateX(100%) translateY(100%) rotate(45deg);
            }
        }
        
        @keyframes containerAppear {
            0% {
                opacity: 0;
                transform: translateY(50px) scale(0.9);
            }
            100% {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }
        
        @keyframes glowMove {
            0% {
                transform: translate(0, 0);
            }
            100% {
                transform: translate(50px, 50px);
            }
        }
    </style>
</head>
<body>
    <div class="floating-shapes">
        <div class="shape"></div>
        <div class="shape"></div>
        <div class="shape"></div>
        <div class="shape"></div>
    </div>
    
    <div class="glow"></div>
    <div class="glow"></div>
    
    <div class="profile-container">
        <div class="profile-header">
            <h2>Personal Profile</h2>
            <p>Welcome to your profile page</p>
        </div>
        
        <div class="profile-details">
            <div class="detail-item">
                <div class="detail-label">
                    <i class="fas fa-user"></i> Full Name
                </div>
                <div class="detail-value">${name}</div>
            </div>
            
            <div class="detail-item">
                <div class="detail-label">
                    <i class="fas fa-id-card"></i> Student ID
                </div>
                <div class="detail-value">${studentID}</div>
            </div>
            
            <div class="detail-item">
                <div class="detail-label">
                    <i class="fas fa-graduation-cap"></i> Program
                </div>
                <div class="detail-value">${program}</div>
            </div>
            
            <div class="detail-item">
                <div class="detail-label">
                    <i class="fas fa-envelope"></i> Email
                </div>
                <div class="detail-value">${email}</div>
            </div>
            
            <div class="detail-item">
                <div class="detail-label">
                    <i class="fas fa-heart"></i> Hobbies
                </div>
                <div class="detail-value">${hobbies}</div>
            </div>
        </div>
        
        <div class="intro-section">
            <div class="intro-label">
                <i class="fas fa-pen"></i> About Me
            </div>
            <div class="intro-text">${intro}</div>
        </div>
    </div>
</body>
</html>