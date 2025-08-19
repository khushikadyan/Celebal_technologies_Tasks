from datetime import datetime, timedelta

def is_today_last_saturday():
    today = datetime.today()
    if today.weekday() != 5:  # Not Saturday
        return False
    next_week = today + timedelta(days=7)
    return next_week.month != today.month

if is_today_last_saturday():
    print(" Today is the last Saturday of the month. Pipeline triggered.")
    # Simulate pipeline run
    # run_pipeline()
else:
    print(" Today is not the last Saturday.")
