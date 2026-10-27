Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39775606A31A
	for <qemu-rust@archiver.kernel.org>; Tue, 27 Oct 2026 19:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T7R2v9C+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CT5JChyV
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1xLnH4-00068z-37; Tue, 27 Oct 2026 15:55:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.cain@oss.qualcomm.com>)
 id 1xLm47-0004Q9-Ui
 for qemu-rust@nongnu.org; Tue, 27 Oct 2026 14:38:31 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.cain@oss.qualcomm.com>)
 id 1xLm45-00063s-Gl
 for qemu-rust@nongnu.org; Tue, 27 Oct 2026 14:38:31 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69RIHWhE1917384
 for <qemu-rust@nongnu.org>; Tue, 27 Oct 2026 18:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=MSRY8NQ1llHDCsNsi9fCJ0
 Ryf/zCCaX5TLLWIdZZhxg=; b=T7R2v9C+scCG18x8PajL2di5WR4NbJnuqbvutp
 YdtyAwvgZSAL1tamKc8oF5VsOWSTNZkNVxrh17wD5PQOSV8tPXRVssoS+DFEN5jX
 6NxlLjThOfg6STBoJ7dYyVS4wuRDXfQkCm4VTTbTGaB2oSd43C1GD7RMvA8Rqah0
 Cu766JVA2kCBjssJ+blqyRsl90ZfVJCmFuJv8j9e/bs1hctx0R6up6TWgMvKu5l3
 8DlTma94XeiMDUH4h78USxDgDtQBHH7kPViVShoRBkMRQyo7dkFyTl93TrouwoE3
 3bAolfMivtH+fbZVCWGL1OkeGVWRxL3dlPZPo8zMOutW9Evw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjux99p73-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-rust@nongnu.org>; Tue, 27 Oct 2026 18:38:26 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id
 46e09a7af769-8486941f252so228519a34.3
 for <qemu-rust@nongnu.org>; Tue, 27 Oct 2026 11:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793126306; x=1793731106; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=MSRY8NQ1llHDCsNsi9fCJ0Ryf/zCCaX5TLLWIdZZhxg=;
 b=CT5JChyVgA6zEh1fXi4jNo64HwodCQPp+MVQqOoq2ReCDOuKcIJUG1MFTNernKarLJ
 PBKaebFSz6+RCQZJnD55o1leb08MrZiSmJXK/Zl9R0n1Ub2hfI8/5xA1fc61GuSkJyTJ
 ys/3Eb+W2d3gmxlXxir0WqHSedhbzUyBl97HqGU2v1xwMeRxdvAe4lb4/U2hAheLTWH8
 VOt4o13OEl35FFcrhePkMuuka3rxoXfaAhU9OZJ7yfFVLCl4gKrCQrWnAlBiBSFWuBf5
 wbtR5YdzPiAHodx2+15K3GLp8t5xfJ7eDCVcummPtY4FNqul0ejtQ+7f+sTESHqW2ivf
 byVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793126306; x=1793731106;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=MSRY8NQ1llHDCsNsi9fCJ0Ryf/zCCaX5TLLWIdZZhxg=;
 b=pNALYgQv3oORmpNghoCcQq1ravglZ44Ddjlv0mK2gc6MenLGYLdM+hB9yxRDqa/Gbi
 vYJ/Bu3KpqUnnChmX9cZmi2nopvuxoIe2JUcXWr3HbtSTuSBFYRT4/CvqCbMXwbhPJaq
 DC5bZbgyARVroFWLo7V5hhjxz7jiZaTvcPZL1FFyC97sOHPZ9hSrf9rbdxSw+GbjDw1f
 j2sWcgV7KzXJCwqd0ON7rqaGP5EpESV7Q+FO3bgc9cRQWMKZ/jUBSlJbkQ+XrJ9ONsE5
 jp/IfaCpEvEEG2L5r5DdCspRm4TGKKCMwKNfvfJcXnBAdb+/lPK+EC6gvZx6uhbFeFTp
 8f4A==
X-Forwarded-Encrypted: i=1;
 AKwUvBwJ5innXli78S1RdX9HN3kiVlDodgN1wYnavucBFQRwzwgRz0WTNlsBGmnenxshuUe0oyZYDcTxK0E=@nongnu.org
X-Gm-Message-State: AFq9FYI9nkFCYmDWBQX/Hm3qW8HSAu1Y7g7eDOmg9nleRG0nA6P+eSUT
 b/uRFavf59C7TQ06sjSG67vrOewG4y2M2JoWtaJKjr9GwgoTQY5lLoRg+nvBGoxF9GqL1cS4CQm
 QLGKWPVtYd7FXhmwjfdhW/F1NABlj0RImLeQ4BxdbCI9mSOY6x4zRiFQ8
X-Gm-Gg: AYBFou19HVkzCXKdynxrdg5l3UTKYwjKvB89OxH38gr0YYRyeCq23YOKVF5aEZXkVkt
 mqa8JOxsMaMQNHCURaNjqliu3RScE9ND5mjYgTpc7Xsf/to2/QsSIo8RHR0ujkqBeVLKGVcFSos
 Tt1mbpdWF2RTwRTP4gatVInI+cEd8AxkexkScFC32Gnc7zwJTTDicBJj9roUOnEOXucbi9m8N77
 K5VfViW4sKfHr6+RpRS6yUr/q1FaYWYECR7FInLEpgZHj8Iweyu5/HXzYnSuSStDAvcbzkkZOfs
 uCvwL0X4yVhdXQN1Mb8BGhThHL5QpjB3j97oDA0ZtAnNm9rzJiJxchv+fzoqLDvaU874xV82B5W
 azhnyi0nNyMbFyowHCKqz3nzbg3YA+X1MDPVaVPsamUCjfmY=
X-Received: by 2002:a05:6830:2642:b0:857:52f3:a5fa with SMTP id
 46e09a7af769-85ab6781853mr449822a34.2.1793126306115; 
 Tue, 27 Oct 2026 11:38:26 -0700 (PDT)
X-Received: by 2002:a05:6830:2642:b0:857:52f3:a5fa with SMTP id
 46e09a7af769-85ab6781853mr449799a34.2.1793126305630; 
 Tue, 27 Oct 2026 11:38:25 -0700 (PDT)
Received: from hu-bcain-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-850fbc1af87sm11800320a34.22.2026.10.27.11.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 11:38:25 -0700 (PDT)
From: Brian Cain <brian.cain@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-rust@nongnu.org,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH 0/3] hw/misc: QUP UART device
Date: Tue, 27 Oct 2026 11:38:20 -0700
Message-Id: <20261027183823.383806-1-brian.cain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Authority-Analysis: v=2.4 cv=GYyCDgXL c=1 sm=1 tr=0 ts=6ae0efa2 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IbvcdFXhcY3Ddu1IGL8A:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-ORIG-GUID: RNFkYD5XREL5D6shBiv2nLf-vD1NghEj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3NCBTYWx0ZWRfX2fRaza8TyIdE
 5q1KEMk1A0nAT4OZQqEZwrrAlS6QL0lttv5PetlOIgkWgOet5dc6cdWF3uclzcEh1SwrbhHNpaI
 7hITsLHlL0UGJ/sUFhs0g0JLfXu4z0ICHjhYBjdPk6pDgUtMGCmxBXB6VS+Qn2j21mdmNqQ5OkV
 LmkYEAZHWq6ioAD8IQlKjBw8s9cAN3YFCpTpeY91cy1yVLCqg3W6PRHr/GIIF7slT954GExo8gU
 PqO8SLqyH8BQ73YuLGetyVAGNTJCu1iW7FdLmfcGxkVMHykwNv4te5ZV3iVwqQk0hCIsO7VLeYz
 WxDMvBGIMnl6mWmh3uYPCvKOYkOYrKQ5VaKlhLu41stbvddAlOwaRwNauvikNezjcUgWbJTnNOq
 gYyVdUioci/N3MKNtZTM9/8nSAQIFjEzQoHA8JVYg9xprvycnHI/ufay0Gklp0/veOAUbmw9KE1
 +/v+FiavkRwdh/lLKPQ==
X-Proofpoint-GUID: RNFkYD5XREL5D6shBiv2nLf-vD1NghEj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3NCBTYWx0ZWRfX9veFD+Rx+lSL
 qkGtMHd3XOslb8tacpoNL/+nwOjJwN4kdaLm7LS7WiHWk1K6WS8N4ceyhCjxIOMEo4z/Q+lqhUa
 YSzNg/1shNGf+RySLZ8XMIJsEIhTfNA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270074
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=brian.cain@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, KHOP_DYNAMIC=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 27 Oct 2026 15:55:57 -0400
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QWRkIHRoZSBRVVAgKyBHRU5JIHVhcnQgZGV2aWNlIG1vZGVscy4gIFRoZSBRVVAgaXMgYSAiVW5p
dmVyc2FsIFBlcmlwaGVyYWwiCnByZXNlbnQgb24gUXVhbGNvbW0gU29Dcywgd2l0aCBjb25uZWN0
aW9ucyBmb3IgU1BJLCBVQVJULCBJMkMsIEkzQy4gIEZvcgpub3cgd2UncmUgb25seSBpbnRlcmVz
dGVkIGluIFVBUlQuCgpXaWxsIGZvbGxvdyB1cCB3aXRoIGEgdjIgaW5jbHVkaW5nIHdpcmluZyBp
bnRvIG1hY2hpbmVzICsgcXRlc3QgYWZ0ZXIKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcWVtdS1k
ZXZlbC8yMDI2MTAyNzE0MzcyMS40MTI1NTg0LTEtYnJpYW4uY2FpbkBvc3MucXVhbGNvbW0uY29t
LwpsYW5kcy4KCkJyaWFuIENhaW4gKDMpOgogIGh3L21pc2M6IGFkZCB0aGUgUVVQIHdyYXBwZXIg
ZGV2aWNlCiAgcnVzdC9jaGFyZGV2OiBmaXggd3JpdGUgZXJyb3JzIGFuZCBhZGQgd3JpdGUgd2F0
Y2hlcwogIHJ1c3QvaHcvY2hhcjogYWRkIFFVUCBHRU5JIFVBUlQgZGV2aWNlIG1vZGVsCgogTUFJ
TlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDMgKwogZG9jcy9z
eXN0ZW0vZGV2aWNlLWVtdWxhdGlvbi5yc3QgICAgICAgICAgICB8ICAgIDEgKwogZG9jcy9zeXN0
ZW0vZGV2aWNlcy9xdXAucnN0ICAgICAgICAgICAgICAgICB8ICAgMTAgKwogaW5jbHVkZS9ody9t
aXNjL3F1cC13cmFwcGVyLmggICAgICAgICAgICAgICB8ICAgMjcgKwogaHcvbWlzYy9xdXAtd3Jh
cHBlci5jICAgICAgICAgICAgICAgICAgICAgICB8ICAgOTAgKysKIENhcmdvLmxvY2sgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDE1ICsKIENhcmdvLnRvbWwgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAxICsKIGh3L21pc2MvS2NvbmZpZyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgICAzICsKIGh3L21pc2MvbWVzb24uYnVpbGQgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgICAzICsKIHJ1c3QvY2hhcmRldi9zcmMvY2hhcmRldi5ycyAg
ICAgICAgICAgICAgICAgfCAgIDgyICstCiBydXN0L2h3L2NoYXIvS2NvbmZpZyAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICAgNCArCiBydXN0L2h3L2NoYXIvbWVzb24uYnVpbGQgICAgICAgICAg
ICAgICAgICAgIHwgICAgMSArCiBydXN0L2h3L2NoYXIvcXVwX2dlbmlfdWFydC9DYXJnby50b21s
ICAgICAgIHwgICAyNyArCiBydXN0L2h3L2NoYXIvcXVwX2dlbmlfdWFydC9tZXNvbi5idWlsZCAg
ICAgIHwgICAyOCArCiBydXN0L2h3L2NoYXIvcXVwX2dlbmlfdWFydC9zcmMvZGV2aWNlLnJzICAg
IHwgMTI5MyArKysrKysrKysrKysrKysrKysrCiBydXN0L2h3L2NoYXIvcXVwX2dlbmlfdWFydC9z
cmMvbGliLnJzICAgICAgIHwgICAgOSArCiBydXN0L2h3L2NoYXIvcXVwX2dlbmlfdWFydC9zcmMv
cmVnaXN0ZXJzLnJzIHwgIDE2MCArKysKIDE3IGZpbGVzIGNoYW5nZWQsIDE3NDEgaW5zZXJ0aW9u
cygrKSwgMTYgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgZG9jcy9zeXN0ZW0vZGV2
aWNlcy9xdXAucnN0CiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9ody9taXNjL3F1cC13cmFw
cGVyLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBody9taXNjL3F1cC13cmFwcGVyLmMKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBydXN0L2h3L2NoYXIvcXVwX2dlbmlfdWFydC9DYXJnby50b21sCiBjcmVhdGUg
bW9kZSAxMDA2NDQgcnVzdC9ody9jaGFyL3F1cF9nZW5pX3VhcnQvbWVzb24uYnVpbGQKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBydXN0L2h3L2NoYXIvcXVwX2dlbmlfdWFydC9zcmMvZGV2aWNlLnJzCiBj
cmVhdGUgbW9kZSAxMDA2NDQgcnVzdC9ody9jaGFyL3F1cF9nZW5pX3VhcnQvc3JjL2xpYi5ycwog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHJ1c3QvaHcvY2hhci9xdXBfZ2VuaV91YXJ0L3NyYy9yZWdpc3Rl
cnMucnMKCi0tIAoyLjM0LjEKCg==

