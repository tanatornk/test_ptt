create table #CardScan (
	EmployeeID int,
  Clock datetime2
)
create table #WorkSchedule (
	EmployeeID int,
  WorkDate date,
  BeginTime datetime2,
  EndTime datetime2
)


INSERT INTO #CardScan (EmployeeID, Clock)
VALUES (1, '2012-01-01 07:00:00'),
       (1, '2012-01-01 12:00:00'),
       (1, '2012-01-01 17:00:00'),
       (2, '2012-01-02 08:40:00'),
       (2, '2012-01-02 20:00:00');

INSERT INTO #WorkSchedule (EmployeeID, WorkDate, BeginTime, EndTime)
VALUES (1, '2012-01-01', '2012-01-01 08:00:00', '2012-01-01 17:00:00'),
       (1, '2012-01-02', '2012-01-02 08:00:00', '2012-01-02 17:00:00'),
       (2, '2012-01-01', '2012-01-01 10:00:00', '2012-01-01 20:00:00'),
       (2, '2012-01-02', '2012-01-02 10:00:00', '2012-01-02 20:00:00');



select * from #CardScan

select 
    t1.EmployeeID,
    t1.WorkDate,
    min(t2.Clock) as ClockIn,
    max(t2.Clock) as ClockOut
 from #WorkSchedule t1 
inner join #CardScan t2 on t1.EmployeeID = t2.EmployeeID 
    and CAST(Clock as Date) = WorkDate
    Group by t1.EmployeeID,
    t1.WorkDate

drop table #CardScan
drop table #WorkSchedule