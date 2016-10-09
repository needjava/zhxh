{#foreach $T as row}
<div class="panel border-sub">
	<div class="panel-head">
		<strong>我的帐户[<span style="color:red">{$T.row.companyname}</span>]</strong>
		<span class="float-right"><strong>状态[<span style="color:{#if $T.row.bankstate == 0}red{#else}blue{#/if}">{$T.row.bankstatetxt}</span>]</strong></span>
	</div>
	<div class="panel-body">
		<table class="table">
			<tbody>
				<tr>
					<td align="center" style="border-top: 0px solid #ddd;" width="200">帐户名称</td>
					<td style="border-top: 0px solid #ddd;">金额</td>
					<td style="border-top: 0px solid #ddd;" width="200" align="right">操作</td>
				</tr>
				{#if $P.identity == "1"}
					<tr>
						<td align="center">收入总计</td>
						<td>￥{$T.row.incomebank}</td>
						<td align="right"><a href="javascript:;">查看记录</a></td>
					</tr>
					<tr>
						<td align="center">支出总计</td>
						<td>￥{$T.row.costbank}</td>
						<td align="right"><a href="javascript:;">查看记录</a></td>
					</tr>
					<tr>
						<td align="center">可提现帐户</td>
						<td>￥{$T.row.takenbank}</td>
						<td align="right"><a href="javascript:;">提现</a> | <a href="javascript:;">查看记录</a></td>
					</tr>
					<tr>
						<td align="center">平台售额总计</td>
						<td>￥{$T.row.sellbank}</td>
						<td align="right"><a href="javascript:;">查看记录</a></td>
					</tr>
				{#elseif $P.identity == "A"}
					<tr>
						<td align="center">收入总计</td>
						<td>￥{$T.row.incomebank}</td>
						<td align="right"><a href="javascript:;">查看记录</a></td>
					</tr>
					<tr>
						<td align="center">支出总计</td>
						<td>￥{$T.row.costbank}</td>
						<td align="right"><a href="javascript:;">查看记录</a></td>
					</tr>
					<tr>
						<td align="center">可提现帐户</td>
						<td>￥{$T.row.takenbank}</td>
						<td align="right"><a href="javascript:;" onclick="recharge('{$T.row.parentid}',2)">充值</a> | <a href="javascript:;" onclick="withdrawal('{$T.row.parentid}','{$T.row.takenbank}',3)">提现</a> | <a href="javascript:;">查看记录</a></td>
					</tr>
					<tr>
						<td align="center">可支配账户</td>
						<td>￥{$T.row.havebank}</td>
						<td align="right"><a href="javascript:;" onclick="recharge('{$T.row.parentid}',1)">充值</a></td>
					</tr>
					<tr>
						<td align="center">平台售额总计</td>
						<td>￥{$T.row.sellbank}</td>
						<td align="right"><a href="javascript:;">查看记录</a></td>
					</tr>
					<tr>
						<td align="center">配额总计</td>
						<td>￥{$T.row.quotabank}</td>
						<td align="right"><a href="javascript:;">查看记录</a></td>
					</tr>
					<tr>
						<td align="center">充值总计</td>
						<td>￥{$T.row.depositbank}</td>
						<td align="right"><a href="javascript:;">查看记录</a></td>
					</tr>
				{#elseif $P.identity == "C"}
					<tr>
						<td align="center">充值总计</td>
						<td>￥{$T.row.depositbank}</td>
						<td align="right"><a href="javascript:;">查看记录</a></td>
					</tr>
					<tr>
						<td align="center">配额总计</td>
						<td>￥{$T.row.quotabank}</td>
						<td align="right"><a href="javascript:;">查看记录</a></td>
					</tr>
					<tr>
						<td align="center">平台售额总计</td>
						<td>￥{$T.row.sellbank}</td>
						<td align="right"><a href="javascript:;">查看记录</a></td>
					</tr>
					<tr>
						<td align="center">平台售额可提现帐户</td>
						<td>￥{$T.row.selltakenbank}</td>
						<td align="right"><a href="javascript:;" onclick="withdrawal('{$T.row.parentid}','{$T.row.selltakenbank}',5)">提现</a> | <a href="javascript:;">查看记录</a></td>
					</tr>
					<tr>
						<td align="center">可支配账户</td>
						<td>￥{$T.row.havebank}</td>
						<td align="right"><a href="javascript:;" onclick="recharge('{$T.row.parentid}')">充值</a></td>
					</tr>
					<tr>
						<td align="center">返利</td>
						<td>￥{$T.row.rebatesbank}</td>
						<td align="right"><a href="javascript:;">查看记录</a></td>
					</tr>
					<tr>
						<td align="center">奖励总计</td>
						<td>￥{$T.row.bonusesbank}</td>
						<td align="right"><a href="javascript:;">查看记录</a></td>
					</tr>
					<tr>
						<td align="center">奖励可提现账户</td>
						<td>￥{$T.row.bonusestakenbank}</td>
						<td align="right"><a href="javascript:;" onclick="transfBuyBank('{$T.row.parentid}','{$T.row.bonusestakenbank}')">转货款</a> | <a href="javascript:;" onclick="withdrawal('{$T.row.parentid}','{$T.row.bonusestakenbank}',4)">提现</a> | <a href="javascript:;">查看记录</a></td>
					</tr>
				{#/if}
			</tbody>
		</table>
	</div>
</div>
<br>
{#/for}
