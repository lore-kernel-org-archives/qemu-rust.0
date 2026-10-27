Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F222F606A31D
	for <qemu-rust@archiver.kernel.org>; Tue, 27 Oct 2026 19:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jmYZjh0+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BnlGYtfU
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1xLnH4-00069J-Tp; Tue, 27 Oct 2026 15:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.cain@oss.qualcomm.com>)
 id 1xLm49-0004QP-D9
 for qemu-rust@nongnu.org; Tue, 27 Oct 2026 14:38:33 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.cain@oss.qualcomm.com>)
 id 1xLm45-000643-HF
 for qemu-rust@nongnu.org; Tue, 27 Oct 2026 14:38:32 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69RIIAvx3486342
 for <qemu-rust@nongnu.org>; Tue, 27 Oct 2026 18:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OvgCz/aiBg4z5rskkJNYorqgdw8LMvxQ0ODPJIsINF0=; b=jmYZjh0+BAqUsMIX
 NOmcMgl3HV3qxVHaVNf+LJX0SQGNCnzBbQm5mXCxi6Pez/attseA/mv+BGt2jkxC
 MQ2UTXm9MpOGxin1xIhwv/AE9hBXnBSfNYNB7mE1XgILKAuFm7YD8NBCcvooMbsM
 jozxn3rrVRJTWCefNtPeJOuRbvvn6IBloK95Zr3ia0/+2/NXEg/nDdCzDJYivcOE
 Rdfm02lBSPEBuyYHsTye4mJ8Pq7tHCx5muqCN26ag/SjPXHQWdBzkIRO4H/ssYBM
 UsuUvFc4oudnJDQY452EnTlW9ruiixAvvwykaSKl7WM0qsYmrgRkAA6+VfbeeD7a
 hUcWSw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbtbwbn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-rust@nongnu.org>; Tue, 27 Oct 2026 18:38:28 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id
 46e09a7af769-84c4dce8182so227512a34.2
 for <qemu-rust@nongnu.org>; Tue, 27 Oct 2026 11:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793126308; x=1793731108; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=OvgCz/aiBg4z5rskkJNYorqgdw8LMvxQ0ODPJIsINF0=;
 b=BnlGYtfU2o6TwSleVfcUCQCE70Wf222XhGjGb2749BTDxf7+EqsPpmz+XstePAQNTh
 VBYq9mFQC6y+ePjDQ6KvKKe4p7uAtOkM3k699cGJdxq/PRcovV4KntxoATtzCCZ9mkT1
 pSdcrEqBQQHQFjsENumZPmA0Bv/DSmztb+GoVQQZi9X799YqVLaoUuSbgye1N+PluSvU
 keaQOFc//aLPL/gK9Wt5pH1FTvb4C9Ft3nUYZaO1R2t4YKwpGMObX07gYa0G5+5s21uu
 aSWhtnjKG1MkxFCmv3JmgUp25LNvS5b9XoJm8EB3czPmjrOvkbBo8wQ4eqjZB+bcvONC
 LRiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793126308; x=1793731108;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=OvgCz/aiBg4z5rskkJNYorqgdw8LMvxQ0ODPJIsINF0=;
 b=jKJK3XPMldFEz/+3gudIz7TncszEtY+/45Bqlb9J+AoTxkrjjz9ddddUQRDdCtiBwf
 GukvXSUjl+DVbNJi1/+fD0B12f+urM7GVXa3oLF1+o3JLKEHYZMiXmUcw5hP3IK7HH6A
 OCkyOj4B/Zi5H2nccHEKPcCldqC/gjAmyE9F/ZzVt5fyIn+IO3S6ysVkzPz3sgsjjmJx
 7ffKsjpXzeg7mlezsDdFj9gvNkOrUMjq4Zkw9ODOzGayVNGMTkU+2pqLYm2WdBo8wwLh
 Q0yOZoj609JX8ivk1zQ6/MjPyJcbzePqHv0HNUTt+1q8X28Hm0H0ygdSTGjHPb5tCKqO
 rsBw==
X-Forwarded-Encrypted: i=1;
 AKwUvByHOG1JkO5M10WaHkMxv6ZZS1TVh2ETBDDroQrJUrW/uHfcVoe0gFUtTcolJNmDMwTKi7DNLN80MgA=@nongnu.org
X-Gm-Message-State: AFq9FYJE3AlbmTP9o2VDRSdlAgh/dAQAvajix6LTbJlKOTEWve8+jLQk
 FozRiiFBKg0DshL+2PSrE0U0GD4CsamSmarxId6N3qVImIbl7Q/gEXo6bzV//NSJa75gSWh655b
 jtKMRQlFjRRpqURTtbnyRsiyMBxkDk17EP0vC8mIbHQPMN0wZrJopI1go
X-Gm-Gg: AYBFou2zA584UC+wFyoLsaGh4nfBN1o6LqKJg3LtbzyMfjk8YLqWiVL1mVhwQb1Q2rX
 nFtL4FASnk0ftPy58svedtcPmSZsObFIemtWprJE9XB9BYVR94VFgfAdVEYk3WAnqjE5dT5MsGT
 ub44Ekj5TU9Y4qf3JehuTB47kiU0uGZCxIB65NrQ4r7b4sA5Owp6A+AyX+T1fEpHq2rbCHNR0Y1
 FO615BB3cFaw2fTQ+KyFucs6o6MrkhM2kAW6xpIrV8x1zROvsGKoMz4NXi4pOnENNFkWq6Kelmp
 dnaDQYZ3Gm79jdvWrG0x3Ccbpf74/eTKV4utIv+E5Fyl9AQXOWyNIBHocfeAabKmqf/+zKreAmr
 Y0afQ9DVvulXxDup/SPN/+yG1vk2VOBui/8E0//PusXpDbws=
X-Received: by 2002:a05:6820:a08a:b0:6f5:a49:6161 with SMTP id
 006d021491bc7-70ba0e8b99dmr5143070eaf.61.1793126307475; 
 Tue, 27 Oct 2026 11:38:27 -0700 (PDT)
X-Received: by 2002:a05:6820:a08a:b0:6f5:a49:6161 with SMTP id
 006d021491bc7-70ba0e8b99dmr5143058eaf.61.1793126307056; 
 Tue, 27 Oct 2026 11:38:27 -0700 (PDT)
Received: from hu-bcain-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-850fbc1af87sm11800320a34.22.2026.10.27.11.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 11:38:26 -0700 (PDT)
From: Brian Cain <brian.cain@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-rust@nongnu.org,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH 1/3] hw/misc: add the QUP wrapper device
Date: Tue, 27 Oct 2026 11:38:21 -0700
Message-Id: <20261027183823.383806-2-brian.cain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261027183823.383806-1-brian.cain@oss.qualcomm.com>
References: <20261027183823.383806-1-brian.cain@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3NCBTYWx0ZWRfX4w46rqLXhCqs
 ZlaNhrZYR3ChU8d6KVxRLe2LlWF8hITL+KCI22Cxk9URXq34rvzVGIABE5P403TIkIeW1xHqKTr
 m5jfcaRpfbFzGgfPWLkhSWFZVZs6yz0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3NCBTYWx0ZWRfX5Yeu3KvC5VI8
 q3zB/MXY8EuirrYXxMz4Vbg23iP+wVm162weMT2OnwtvPcVhfoFOgXNFtpLRDViYi9edkxOxAxa
 96UQh4LxpvQABIofrff5knfs4MJPaPSQHTQrKEEUKmMiCVs9rCF/8jGXvWMZKKi2tpGcCuxXoqw
 e9TcOY82Yhxpa9f+sxm51njC/E+wqqYf9GgapnfMBLKOpR72usoyQsgpAg5FTwUym+IrP2Bu6oy
 S5ntCGmeVloHrz2tWoe53UVpC8o8RTlONtQ5GXJ9AA0oLCNowNqP5UN1pYknR1h7ucwkL2/6tkG
 OQw4A+pRL9N0DFlIxq6vdE3AeRIVOMuUg5pIy4inJjBNNul7qPsKxKhjE4c69ztFL8GJAN5xb/w
 3D/XLa5nBsL2uD7bK1XFZM+h9p7Xppuv7aHzyrRljWvV1oH4k20Bo/yluXMGm7HqMLesXnJqWFB
 QzvY/PTrYW4UR2OWVag==
X-Proofpoint-ORIG-GUID: wz0CifFSMfWqao85jyjUs8eXPNhKNxrH
X-Proofpoint-GUID: wz0CifFSMfWqao85jyjUs8eXPNhKNxrH
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae0efa4 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=4ZT9pb2Fk4yPPggULgoA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1011 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270074
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=brian.cain@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, KHOP_DYNAMIC=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhlIExpbnV4IHFjb21fZ2VuaV9zZXJpYWwgZHJpdmVyIGV4cGVjdHMgYSBHRU5JIFVBUlQgdG8g
YmUgYSBjaGlsZCBvZgphIFFVUCB3cmFwcGVyLgoKU2lnbmVkLW9mZi1ieTogQnJpYW4gQ2FpbiA8
YnJpYW4uY2FpbkBvc3MucXVhbGNvbW0uY29tPgotLS0KIE1BSU5UQUlORVJTICAgICAgICAgICAg
ICAgICAgIHwgIDIgKwogaW5jbHVkZS9ody9taXNjL3F1cC13cmFwcGVyLmggfCAyNyArKysrKysr
KysrKwogaHcvbWlzYy9xdXAtd3JhcHBlci5jICAgICAgICAgfCA5MCArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKwogaHcvbWlzYy9LY29uZmlnICAgICAgICAgICAgICAgfCAgMyAr
KwogaHcvbWlzYy9tZXNvbi5idWlsZCAgICAgICAgICAgfCAgMyArKwogNSBmaWxlcyBjaGFuZ2Vk
LCAxMjUgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvaHcvbWlzYy9x
dXAtd3JhcHBlci5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgaHcvbWlzYy9xdXAtd3JhcHBlci5jCgpk
aWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCA0Y2ExNzUxZTMwZi4u
MDY0ZDk1MzFkM2UgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBA
IC0xMzgzLDcgKzEzODMsOSBAQCBNOiBCcmlhbiBDYWluIDxicmlhbi5jYWluQG9zcy5xdWFsY29t
bS5jb20+CiBSOiBQaWVycmljayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVyQG9zcy5xdWFsY29t
bS5jb20+CiBTOiBTdXBwb3J0ZWQKIEY6IGh3L2hleGFnb24vCitGOiBody9taXNjL3F1cC13cmFw
cGVyLmMKIEY6IGluY2x1ZGUvaHcvaGV4YWdvbi8KK0Y6IGluY2x1ZGUvaHcvbWlzYy9xdXAtd3Jh
cHBlci5oCiBGOiBjb25maWdzL2RldmljZXMvaGV4YWdvbi1zb2Z0bW11L2RlZmF1bHQubWFrCiBG
OiBkb2NzL3N5c3RlbS9oZXhhZ29uLwogRjogdGVzdHMvZnVuY3Rpb25hbC9oZXhhZ29uLwpkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9ody9taXNjL3F1cC13cmFwcGVyLmggYi9pbmNsdWRlL2h3L21pc2Mv
cXVwLXdyYXBwZXIuaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMC4uNjE4
MDA5MmI3OTkKLS0tIC9kZXYvbnVsbAorKysgYi9pbmNsdWRlL2h3L21pc2MvcXVwLXdyYXBwZXIu
aApAQCAtMCwwICsxLDI3IEBACisvKgorICogUVVQIHdyYXBwZXIgKEdFTkkgU0UgUVVQKSBkZXZp
Y2UKKyAqCisgKiBDb3B5cmlnaHQgKGMpIFF1YWxjb21tIFRlY2hub2xvZ2llcywgSW5jLiBhbmQv
b3IgaXRzIHN1YnNpZGlhcmllcy4KKyAqIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
LW9yLWxhdGVyCisgKi8KKworI2lmbmRlZiBIV19NSVNDX1FVUF9XUkFQUEVSX0gKKyNkZWZpbmUg
SFdfTUlTQ19RVVBfV1JBUFBFUl9ICisKKyNpbmNsdWRlICJody9jb3JlL3N5c2J1cy5oIgorI2lu
Y2x1ZGUgInFvbS9vYmplY3QuaCIKKworI2RlZmluZSBUWVBFX1FVUF9XUkFQUEVSICJxdXAtd3Jh
cHBlciIKK09CSkVDVF9ERUNMQVJFX1NJTVBMRV9UWVBFKFF1cFdyYXBwZXJTdGF0ZSwgUVVQX1dS
QVBQRVIpCisKKyNkZWZpbmUgUVVQX1dSQVBQRVJfTU1JT19TSVpFIDB4NjAwMAorCitzdHJ1Y3Qg
UXVwV3JhcHBlclN0YXRlIHsKKyAgICBTeXNCdXNEZXZpY2UgcGFyZW50X29iajsKKworICAgIE1l
bW9yeVJlZ2lvbiBpb21lbTsKKworICAgIHVpbnQzMl90IGh3X3ZlcnNpb247Cit9OworCisjZW5k
aWYgLyogSFdfTUlTQ19RVVBfV1JBUFBFUl9IICovCmRpZmYgLS1naXQgYS9ody9taXNjL3F1cC13
cmFwcGVyLmMgYi9ody9taXNjL3F1cC13cmFwcGVyLmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMDAwMDAuLjQwYzc5ZGM2NmU2Ci0tLSAvZGV2L251bGwKKysrIGIvaHcvbWlzYy9x
dXAtd3JhcHBlci5jCkBAIC0wLDAgKzEsOTAgQEAKKy8qCisgKiBRVVAgd3JhcHBlciBkZXZpY2UK
KyAqCisgKiBDb3B5cmlnaHQgKGMpIFF1YWxjb21tIFRlY2hub2xvZ2llcywgSW5jLiBhbmQvb3Ig
aXRzIHN1YnNpZGlhcmllcy4KKyAqIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9y
LWxhdGVyCisgKi8KKworI2luY2x1ZGUgInFlbXUvb3NkZXAuaCIKKyNpbmNsdWRlICJody9jb3Jl
L3N5c2J1cy5oIgorI2luY2x1ZGUgImh3L2NvcmUvcWRldi1wcm9wZXJ0aWVzLmgiCisjaW5jbHVk
ZSAiaHcvbWlzYy9xdXAtd3JhcHBlci5oIgorI2luY2x1ZGUgInFlbXUvbG9nLmgiCisKKyNkZWZp
bmUgUkVHX1FVUFYzX0hXX1ZFUiAweDQKKworc3RhdGljIHVpbnQ2NF90IHF1cF93cmFwcGVyX3Jl
YWQodm9pZCAqb3BhcXVlLCBod2FkZHIgb2Zmc2V0LCB1bnNpZ25lZCBzaXplKQoreworICAgIFF1
cFdyYXBwZXJTdGF0ZSAqcyA9IFFVUF9XUkFQUEVSKG9wYXF1ZSk7CisgICAgdWludDY0X3QgdmFs
dWUgPSAwOworCisgICAgc3dpdGNoIChvZmZzZXQpIHsKKyAgICBjYXNlIFJFR19RVVBWM19IV19W
RVI6CisgICAgICAgIHZhbHVlID0gcy0+aHdfdmVyc2lvbjsKKyAgICAgICAgYnJlYWs7CisgICAg
ZGVmYXVsdDoKKyAgICAgICAgcWVtdV9sb2dfbWFzayhMT0dfVU5JTVAsICJxdXAtd3JhcHBlcjog
cmVhZCBmcm9tIHVua25vd24gb2Zmc2V0IDB4JSIKKyAgICAgICAgICAgICAgICAgICAgICBIV0FE
RFJfUFJJeCAiXG4iLCBvZmZzZXQpOworICAgICAgICBicmVhazsKKyAgICB9CisKKyAgICByZXR1
cm4gdmFsdWU7Cit9CisKK3N0YXRpYyB2b2lkIHF1cF93cmFwcGVyX3dyaXRlKHZvaWQgKm9wYXF1
ZSwgaHdhZGRyIG9mZnNldCwgdWludDY0X3QgdmFsdWUsCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBzaXplKQoreworICAgIHFlbXVfbG9nX21hc2soTE9HX1VOSU1QLCAi
cXVwLXdyYXBwZXI6IHdyaXRlIHRvIG9mZnNldCAweCUiCisgICAgICAgICAgICAgICAgICBIV0FE
RFJfUFJJeCAiIHZhbHVlIDB4JSIgUFJJeDY0ICJcbiIsIG9mZnNldCwgdmFsdWUpOworfQorCitz
dGF0aWMgY29uc3QgTWVtb3J5UmVnaW9uT3BzIHF1cF93cmFwcGVyX29wcyA9IHsKKyAgICAucmVh
ZCA9IHF1cF93cmFwcGVyX3JlYWQsCisgICAgLndyaXRlID0gcXVwX3dyYXBwZXJfd3JpdGUsCisg
ICAgLmVuZGlhbm5lc3MgPSBERVZJQ0VfTElUVExFX0VORElBTiwKKyAgICAudmFsaWQgPSB7Cisg
ICAgICAgIC5taW5fYWNjZXNzX3NpemUgPSAxLAorICAgICAgICAubWF4X2FjY2Vzc19zaXplID0g
NCwKKyAgICB9LAorICAgIC5pbXBsID0geworICAgICAgICAubWluX2FjY2Vzc19zaXplID0gNCwK
KyAgICAgICAgLm1heF9hY2Nlc3Nfc2l6ZSA9IDQsCisgICAgfSwKK307CisKK3N0YXRpYyB2b2lk
IHF1cF93cmFwcGVyX2luaXQoT2JqZWN0ICpvYmopCit7CisgICAgUXVwV3JhcHBlclN0YXRlICpz
ID0gUVVQX1dSQVBQRVIob2JqKTsKKworICAgIG1lbW9yeV9yZWdpb25faW5pdF9pbygmcy0+aW9t
ZW0sIG9iaiwgJnF1cF93cmFwcGVyX29wcywgcywKKyAgICAgICAgICAgICAgICAgICAgICAgICAg
VFlQRV9RVVBfV1JBUFBFUiwgUVVQX1dSQVBQRVJfTU1JT19TSVpFKTsKKyAgICBzeXNidXNfaW5p
dF9tbWlvKFNZU19CVVNfREVWSUNFKG9iaiksICZzLT5pb21lbSk7Cit9CisKK3N0YXRpYyBjb25z
dCBQcm9wZXJ0eSBxdXBfd3JhcHBlcl9wcm9wZXJ0aWVzW10gPSB7CisgICAgREVGSU5FX1BST1Bf
VUlOVDMyKCJody12ZXJzaW9uIiwgUXVwV3JhcHBlclN0YXRlLCBod192ZXJzaW9uLAorICAgICAg
ICAgICAgICAgICAgICAgICAweDMwMTAwMDAwKSwKK307CisKK3N0YXRpYyB2b2lkIHF1cF93cmFw
cGVyX2NsYXNzX2luaXQoT2JqZWN0Q2xhc3MgKmtsYXNzLCBjb25zdCB2b2lkICpkYXRhKQorewor
ICAgIERldmljZUNsYXNzICpkYyA9IERFVklDRV9DTEFTUyhrbGFzcyk7CisKKyAgICBkZXZpY2Vf
Y2xhc3Nfc2V0X3Byb3BzKGRjLCBxdXBfd3JhcHBlcl9wcm9wZXJ0aWVzKTsKKyAgICBkYy0+ZGVz
YyA9ICJRdWFsY29tbSBRVVAgd3JhcHBlciI7Cit9CisKK3N0YXRpYyBjb25zdCBUeXBlSW5mbyBx
dXBfd3JhcHBlcl9pbmZvID0geworICAgIC5uYW1lICAgICAgICAgID0gVFlQRV9RVVBfV1JBUFBF
UiwKKyAgICAucGFyZW50ICAgICAgICA9IFRZUEVfU1lTX0JVU19ERVZJQ0UsCisgICAgLmluc3Rh
bmNlX3NpemUgPSBzaXplb2YoUXVwV3JhcHBlclN0YXRlKSwKKyAgICAuaW5zdGFuY2VfaW5pdCA9
IHF1cF93cmFwcGVyX2luaXQsCisgICAgLmNsYXNzX2luaXQgICAgPSBxdXBfd3JhcHBlcl9jbGFz
c19pbml0LAorfTsKKworc3RhdGljIHZvaWQgcXVwX3dyYXBwZXJfcmVnaXN0ZXJfdHlwZXModm9p
ZCkKK3sKKyAgICB0eXBlX3JlZ2lzdGVyX3N0YXRpYygmcXVwX3dyYXBwZXJfaW5mbyk7Cit9CisK
K3R5cGVfaW5pdChxdXBfd3JhcHBlcl9yZWdpc3Rlcl90eXBlcykKZGlmZiAtLWdpdCBhL2h3L21p
c2MvS2NvbmZpZyBiL2h3L21pc2MvS2NvbmZpZwppbmRleCA3YWJkMjI4NjlhNC4uYWE3NmEyMzk4
YTkgMTAwNjQ0Ci0tLSBhL2h3L21pc2MvS2NvbmZpZworKysgYi9ody9taXNjL0tjb25maWcKQEAg
LTI2Niw0ICsyNjYsNyBAQCBjb25maWcgSzIzMF9ERUNPTVBfR1pJUAogY29uZmlnIFNPUEhHT19D
VjE4MDBCX0NMSwogICAgIGJvb2wKIAorY29uZmlnIFFVUF9XUkFQUEVSCisgICAgYm9vbAorCiBz
b3VyY2UgbWFjaW8vS2NvbmZpZwpkaWZmIC0tZ2l0IGEvaHcvbWlzYy9tZXNvbi5idWlsZCBiL2h3
L21pc2MvbWVzb24uYnVpbGQKaW5kZXggOTBmM2Y4OWRlNzAuLjljZjg5N2FiYzc2IDEwMDY0NAot
LS0gYS9ody9taXNjL21lc29uLmJ1aWxkCisrKyBiL2h3L21pc2MvbWVzb24uYnVpbGQKQEAgLTE4
MSwzICsxODEsNiBAQCBzeXN0ZW1fc3MuYWRkKHdoZW46ICdDT05GSUdfU0JTQV9SRUYnLCBpZl90
cnVlOiBmaWxlcygnc2JzYV9lYy5jJykpCiBzeXN0ZW1fc3MuYWRkKHdoZW46ICdDT05GSUdfTEFT
SScsIGlmX3RydWU6IGZpbGVzKCdsYXNpLmMnKSkKIAogc3lzdGVtX3NzLmFkZCh3aGVuOiAnQ09O
RklHX0FYSUFET19DTEsnLCBpZl90cnVlOiBmaWxlcygnYXhpYWRvX2Nsay5jJykpCisKKyMgUXVh
bGNvbW0gUVVQIGRldmljZXMKK3N5c3RlbV9zcy5hZGQod2hlbjogJ0NPTkZJR19RVVBfV1JBUFBF
UicsIGlmX3RydWU6IGZpbGVzKCdxdXAtd3JhcHBlci5jJykpCi0tIAoyLjM0LjEKCg==

