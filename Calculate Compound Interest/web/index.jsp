<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Compound Interest Calculator</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .form-container {
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }
        .btn-calculate {
            background-color: #f15b2a;
            color: #ffffff;
        }
        .btn-calculate:hover {
            background-color: #d94a1f;
        }
        .result-container {
            margin-top: 20px;
            padding: 15px;
            background: #e9f7ef;
            border: 1px solid #28a745;
            border-radius: 8px;
        }
    </style>
</head>
<body>
    <div class="d-flex justify-content-center align-items-center min-vh-100">
        <div class="form-container w-100" style="max-width: 500px;">
            <h1 class="text-center fw-bold mb-4">Calculate Compound Interest</h1>
            <form action="CompoundInterestServlet" method="POST">
                <div class="mb-3">
                    <label for="principal-amount" class="form-label">Principal Amount</label>
                    <div class="input-group">
                        <span class="input-group-text">Amt</span>
                        <input type="text" class="form-control" id="principal-amount" name="principal" required>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="interest-rate" class="form-label">Interest Rate (%)</label>
                    <div class="input-group">
                        <input type="text" class="form-control" id="interest-rate" name="rate" required>
                        <span class="input-group-text">%</span>
                    </div>
                </div>
                <div class="row g-3 mb-3">
                    <div class="col-md-6">
                        <label for="years" class="form-label">Years</label>
                        <input type="text" class="form-control" id="years" name="years" required>
                    </div>
                    <div class="col-md-6">
                        <label for="months" class="form-label">Months</label>
                        <input type="text" class="form-control" id="months" name="months" required>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="compound-interval" class="form-label">Compound Interval</label>
                    <select class="form-select" id="compound-interval" name="interval">
                        <option value="365">Daily (365/yr)</option>
                        <option value="360">Daily (360/yr)</option>
                        <option value="52">Weekly (52/yr)</option>
                        <option value="26">Bi-Weekly (26/yr)</option>
                        <option value="12">Monthly (12/yr)</option>
                        <option value="4">Quarterly (4/yr)</option>
                        <option value="1">Yearly (1/yr)</option>
                    </select>
                </div>
                <div class="d-grid">
                    <button type="submit" class="btn btn-calculate btn-lg">Calculate</button>
                </div>
            </form>
            <% if (request.getAttribute("principal") != null) { %>
            <div id="result" class="result-container">
                <h5>Compound Interest Result:</h5>
                <p>Principal: <%= request.getAttribute("principal") %></p>
                <p>Interest: <%= request.getAttribute("interest") %></p>
                <p>Total Amount: <%= request.getAttribute("amount") %></p>
            </div>
            <% } %>
        </div>
    </div>
</body>
</html>
