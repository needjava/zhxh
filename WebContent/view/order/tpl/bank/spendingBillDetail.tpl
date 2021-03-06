
<div class="table-responsive-y">
	<table class="table table-hover">
		<thead><tr>
			<th>账单流水号</th>
			<th>日期</th>
			<th>客户名称</th>
			<th>摘要</th>
			<th>金额</th>
			<th>状态</th>
			<th>操作</th>
		</tr> </thead>
		<tbody>
		{#if $P.rowCount > 0}
			{#foreach $T as row}
				<tr>
					<td>{$T.row.billno}</td>
					<td>{$T.row.createtime}</td>
					<td>{$T.row.u_username} </td>
					<td>{$T.row.trantypetxt} </td>
					<td>￥{$P.formatAmount($T.row.amount)}</td>
					<td>{#if $T.row.status == -1}失败{#elseif $T.row.status == 0}未接收{#elseif $T.row.status == 1}成功{#/if}</td>
					<td><a href="javascript:;" onclick="details('{$T.row.billno}')">详情</a>
						<div id="{$T.row.billno}"style="display:none;">
							<div class="panel-head">
								<strong>提现-账单明细</strong>
							</div>
							<div class="panel-body">
								流水号:{$T.row.billno}&nbsp;&nbsp;日期：{$T.row.createtime}
							</div>
							<div class="table-responsive" style="padding:10px;">
								<table class="table">
									<tbody><tr>
										<th>城市</th>
										<th>银行名称</th>
										<th>开户行</th>
										<th>收款人</th>
										<th>银行卡号</th>
										<th>金额</th>
										<th>手续费</th>
										<th>实收额</th>
										<th>备注</th>
									</tr>
									<tr>
										<td>{$T.row.province_city}</td>
										<td>{$T.row.bankName}</td>
										<td>{$T.row.kaihuhang}</td>
										<td>{$T.row.creditName}</td>
										<td>{$T.row.bankCardNumber}</td>
										<td style="text-align: right;">￥{$P.formatAmount($T.row.amount)}</td>
										<td style="text-align: right;">￥{$P.formatAmount(1)}</td>
										<td style="text-align: right;">￥{$P.formatAmount($T.row.amount - 1)}</td>
										<td>{$T.row.remarks}</td>
									</tr>
								</tbody></table>
							</div>
							<div class="doc-democode doc-codead0" style="margin:10px;">
								<blockquote class="border-yellow doc-quoteyellow">
									<strong>提现须知：</strong>
									1.提交申请后，系统资金账户会直接冲减。<br>
									2.提现手续费为每笔1元。<br>
									3.提交申请后，资金到账时间为T+3，如未到账请联系平台。<br>
								</blockquote>
							</div>
						</div>
					</td>
				</tr>
			{#/for}	
		{#else}
			<tr class="tr" style="height:150px;">
				<td align="center" colspan="7">暂无数据...</td>
			</tr>
		{#/if}
		</tbody>
	</table>
	
	<table class="table table-bordered table-hover text-small" style="border: solid 0px #ddd;">
		<tfoot>
		<tr class="">
			<td colspan="9" style="text-align:right" >
				<div class="page">
					<span>每页显示</span>
					<select class="pageSel">
						<option {#if $P.pageSize == 10}selected{#/if}  value="10">10</option>
						<option {#if $P.pageSize == 50}selected{#/if}  value="50">50</option>
						<option {#if $P.pageSize == 100}selected{#/if}  value="100">100</option>
					</select>
					<span>条</span>
					<div class="page-number">
						<span>第</span>
						<input class="ui-pager-inp" type="text" value="{$P.pageIndex}"> 
						<span>页</span>
						<span>共</span>
						<span class="totalPage">{$P.totalPage}</span>
						<span>页</span>
						<div class="pn">
						{#if $P.pageIndex == 1}
							<a href="javascript:void(0);" class="ui-pager-prev">上一页</a>
						{#else}
							<a href="javascript:void(0);" class="ui-pager-prev" onclick="pageClick({$P.pageIndex-1},2)">上一页</a>
						{#/if}
						{#if $P.pageIndex == $P.totalPage || $P.totalPage == 0}
							<a href="javascript:void(0);" class="ui-pager-next">下一页</a>
						{#else}
							<a href="javascript:void(0);" class="ui-pager-next" onclick="pageClick({$P.pageIndex + 1 },2)">下一页</a>
						{#/if}
						</div>
					</div>
				</div>
				<span class="page-total">共计：[{$P.rowCount}] 条</span>
			</td>
		</tr>
		</tfoot>
	</table>
</div>
