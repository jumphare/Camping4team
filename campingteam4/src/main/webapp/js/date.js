  $(document).ready(function () {
		$("#startDate").datepicker({
			dateFormat: "yy-mm-dd", // 날짜의 형식
			minDate: 0,
			nextText: ">",
			prevText: "<",
			onSelect: function (date) {
				var endDate = $('#endDate');
				var startDate = $(this).datepicker('getDate');
				var minDate = $(this).datepicker('getDate');
				endDate.datepicker('setDate', minDate);
				startDate.setDate(startDate.getDate() + 30);
				endDate.datepicker('option', 'maxDate', startDate);
				endDate.datepicker('option', 'minDate', minDate);
			}
		});
		$('#endDate').datepicker({
			dateFormat: "yy-mm-dd", // 날짜의 형식
			nextText: ">",
			prevText: "<"
		});
	});