Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29E6606A31A
	for <qemu-rust@archiver.kernel.org>; Tue, 27 Oct 2026 19:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vef6Gczz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SQ01R9JN
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1xLnH4-000690-A3; Tue, 27 Oct 2026 15:55:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.cain@oss.qualcomm.com>)
 id 1xLm4A-0004QZ-1H
 for qemu-rust@nongnu.org; Tue, 27 Oct 2026 14:38:34 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.cain@oss.qualcomm.com>)
 id 1xLm47-00064C-M9
 for qemu-rust@nongnu.org; Tue, 27 Oct 2026 14:38:33 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69RIHr9G2960749
 for <qemu-rust@nongnu.org>; Tue, 27 Oct 2026 18:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 v8qolIpATIkxUSqXwD7s/iQhlQCSfO4+aP5WR8EkJa8=; b=Vef6GczzQoExiJdj
 OfD39XsFOhCuFBUe97HVhRVwzMnmZRRz5jeMUj8tQ+AeYnb0Wac7Zc00HSZPGne7
 iGWBH683ZQkoLBRAHqd2Up++7eg8/MKoD9nHav7LBcqpd9G/OJ0V0MYKDrPwuUgN
 w65uv5gGURyypo1ejGRYhcLdVLVmS+MKVHLhKQS/EOJBSWqOiGb5CEmgrhdZ8moZ
 BEAK3LrUKsBgfQwUEjLhtIeoUk7+gRZQkhYCfbATd7UJizLblc2CRFA5b23Cg8C6
 h0L3qAs+2GPMQ7tMXnzh3mYIjqYsbLSE2oPu7UnmerVhdhFE7xYU9o78CYRZftCk
 tGggdw==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy670pj8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-rust@nongnu.org>; Tue, 27 Oct 2026 18:38:29 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-8488f31d754so159756a34.0
 for <qemu-rust@nongnu.org>; Tue, 27 Oct 2026 11:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793126309; x=1793731109; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=v8qolIpATIkxUSqXwD7s/iQhlQCSfO4+aP5WR8EkJa8=;
 b=SQ01R9JNF2tpa32QjZRt9SFY7P6iqcyKzEYcOEk+ZGGL+1Iu4jpoGDSLp+EbUrINGC
 lh6CaWGN5RScSrGOWSRpGNGcdxuIEBYWxohOmiokOrgUaMU4/Ev1jQctJGkWpVGqbac3
 PS4hQS3dzTP+pNJU5bNLNPoDeKfvdO1KXuxKLfao6Y7l91XRvb5lgrugxLVgrDI6yxGn
 DcAJdj0shU44RrAHKSf4KqBTKrpSMc7iI5HxVBcVMdm6TNEhsqwKdSF4fUlF+trxtMus
 GdJdkYO15pl3YiX8JJYg4DIN10vhA3wYn0AjIz5R6CxI8qHOZzra0rwlKqOdNB+TeF8L
 ERJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793126309; x=1793731109;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=v8qolIpATIkxUSqXwD7s/iQhlQCSfO4+aP5WR8EkJa8=;
 b=WrXW8onkd1sCY9Ju/9Mx2V3nP8bDh6yLaRCubCARMn/3J+EViVoVfFH2PPQKF1vrjG
 Et9/UfTYNfUykAdHa8Hs1qEUCVOhxaTiotH7Z3fx2T3z8VW+8xoW/YH9i8sVJ2k73OQP
 Ic0sG14LxjRAznsvXCG4QgbqslKlNeqg0Ulx33FhDHftjyXyjX8mKIAPEdi+cnwB21MI
 iQyeaPkIMre3vLMGjFq/Gf+6IEDUxoFTBF8JYpAVkxjM/XjK9VenhfBeRO0xRNwYUN9b
 5mX4tcWMJdbnptgYkL7W7dsgHaQ1fHRqnuXn1FwmpAS7w98Y9bchKU94Qs8+3MEAFyWS
 EShA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzTPG1pA2XHNl/1wsA2JLoIFpl9bfPAPYcn8DRbJM+zlDoHBxGm4xA5xWvsP3irFbOPmAGtG39QsAU=@nongnu.org
X-Gm-Message-State: AFq9FYKSDxNgX8BOUJhCVcDqInXsd5xT709GlojH5ktM2PHe+svmYJkJ
 c+oCWczU7DDA/hsOhQN39B7d3wrpAMSj5Orj5tX+XVI8Wd0nk+aQjSNSnYS8nuftrPb5HhYO02J
 GZTYZPDudNGwT1Shedxlub/16niDGbJWZpIbI2FZevbEttNjtrYmXyXZv
X-Gm-Gg: AYBFou0kval9MpFJF5S6H6NUz63O9BJymryX/Yoltp3Q37uJfAUvhU1BnK76vWAKlQy
 cciCQOb4BeUWqInWiTvaBZulOlxEDoPd2b22/UMdoxPgII/ewrRhi3aYekonxdoUjDrOEgqSqpV
 NaugBbzpQ+/QdTsVX7T9wgXL39ofpuhcpmRj9lSYxU3e+rM8zLdii3cVpQKigjY5okQCNC2TcGJ
 5PN3Uy9Ax7XmBIM4tKO/2ohAW8qcQrmu3cq9FLx6QHy8ZztcuUVI0Jjnok2yN6PmWkBjOOr7Mfb
 cgzfuhSNtDofYFCEg4Qipgo/rRyDGYSZiq9GCfkES7kdfgXGxjaqNwHGpQ22pSNPXEOnrm0Pg+d
 tLMF8Oql5HnxE+JOayk7C/Six+6HtU2mFKQIAeX5EhUQDz+4=
X-Received: by 2002:a05:6830:348c:b0:829:9992:2106 with SMTP id
 46e09a7af769-85ac0af0201mr341083a34.22.1793126308868; 
 Tue, 27 Oct 2026 11:38:28 -0700 (PDT)
X-Received: by 2002:a05:6830:348c:b0:829:9992:2106 with SMTP id
 46e09a7af769-85ac0af0201mr341058a34.22.1793126308408; 
 Tue, 27 Oct 2026 11:38:28 -0700 (PDT)
Received: from hu-bcain-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-850fbc1af87sm11800320a34.22.2026.10.27.11.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 11:38:27 -0700 (PDT)
From: Brian Cain <brian.cain@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-rust@nongnu.org,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH 2/3] rust/chardev: fix write errors and add write watches
Date: Tue, 27 Oct 2026 11:38:22 -0700
Message-Id: <20261027183823.383806-3-brian.cain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261027183823.383806-1-brian.cain@oss.qualcomm.com>
References: <20261027183823.383806-1-brian.cain@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Proofpoint-ORIG-GUID: FBVMH9ywRMJ0ZZYdifHqsgUJL6qIe192
X-Authority-Analysis: v=2.4 cv=QvfLTlyd c=1 sm=1 tr=0 ts=6ae0efa5 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=NctktJFTRqHPrne6ecwA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3NCBTYWx0ZWRfX/AcjSgiXHivW
 D8WThPJ7HSTju0xZDWPxc12cY+PMTZmNzPEyhs+ntFX2p9AWOUjEddH3XttXAzqaP3JRQCP50fg
 IqtVWugSRIIDfDhkQHcg3KhAzjUnIQY=
X-Proofpoint-GUID: FBVMH9ywRMJ0ZZYdifHqsgUJL6qIe192
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3NCBTYWx0ZWRfXxlD5tbSegLNV
 hxGqo3doJfCFmi0Fh+kM4GqglU7faCH5CWH9dst525vCAtv7qUqHY3AuQOKexc1twlsdvWXW3Wc
 j+hAUHfciWGOHTWo8BMiho5Kg1nPPnI3Gov3Np0ovvTCEg9WBMwhDmWJ7yMjPUQ+081+IF16BPE
 SocXeZfjll2gkPPKsVUKmR3AdQR3nG3K5qg+62ob1TQodtIQ4HKEoEquNMG4yb2Z3n1hTNiAhSR
 6ylG2PPC9NluctWWrHosGk7y8jWdCUDgWERRpW7X2uEM/OV55ReAoCvtZf5i0hHOyQJTaUC7Sq1
 NOHSui15UkxRUjzxp540q6D8N0yW0VP6WGJCL7/6qTjS7iF6n3tUgxFtNDxFGuypwETga+SjqAe
 nJICWkR4zQKTSf/uZf7KsE0nA2VmeVip+9YE0RFQwl1yIDhv0klb5RUygo81qtKoVRZArf7xFKG
 fVK15eepM64WxVs4olg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
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

cWVtdV9jaHJfZmVfd3JpdGUoKSByZXBvcnRzIGZhaWx1cmUgYXMgLTEgd2l0aCB0aGUgY2F1c2Ug
aW4gZXJybm8sIG5vdAphcyBhIG5lZ2F0ZWQgZXJybm8sIHNvIGVycm5vOjppbnRvX2lvX3Jlc3Vs
dCgpIHR1cm5lZCBldmVyeSBmYWlsdXJlIGludG8KRVBFUk0gYW5kIGEgZnJvbnRlbmQgY291bGQg
bmV2ZXIgc2VlIEVBR0FJTi4gIEJ1aWxkIHRoZSBlcnJvciBmcm9tCmVycm5vIGluc3RlYWQsIGlu
IGJvdGggQ2hhckZyb250ZW5kOjp3cml0ZSgpIGFuZCB0aGUgQlFMLWZyZWUgdmFyaWFudC4KCkFs
c28gYWRkIENoYXJGcm9udGVuZDo6YWRkX3dyaXRlX3dhdGNoKCkgYW5kIHJlbW92ZV93YXRjaCgp
LCBzbyB0aGF0IGEKZGV2aWNlIHdob3NlIGJhY2tlbmQgd291bGQgYmxvY2sgY2FuIHJldHJ5IG9u
Y2UgaXQgaXMgd3JpdGFibGUgYWdhaW4uCnJlbW92ZV93YXRjaCgpIHRvbGVyYXRlcyBhIHNvdXJj
ZSB0aGF0IHRoZSBiYWNrZW5kIGhhcyBhbHJlYWR5IHRvcm4KZG93bi4KClNpZ25lZC1vZmYtYnk6
IEJyaWFuIENhaW4gPGJyaWFuLmNhaW5Ab3NzLnF1YWxjb21tLmNvbT4KLS0tCiBydXN0L2NoYXJk
ZXYvc3JjL2NoYXJkZXYucnMgfCA4MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNjYgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvcnVzdC9jaGFyZGV2L3NyYy9jaGFyZGV2LnJzIGIvcnVzdC9jaGFyZGV2L3Ny
Yy9jaGFyZGV2LnJzCmluZGV4IGZiOTY3NGIzZmI0Li44YTM4MzZkNzhlNCAxMDA2NDQKLS0tIGEv
cnVzdC9jaGFyZGV2L3NyYy9jaGFyZGV2LnJzCisrKyBiL3J1c3QvY2hhcmRldi9zcmMvY2hhcmRl
di5ycwpAQCAtNTQsNyArNTQsMTEgQEAgZm4gd3JpdGUoJm11dCBzZWxmLCBidWY6ICZbdThdKSAt
PiBpbzo6UmVzdWx0PHVzaXplPiB7CiAKICAgICAgICAgbGV0IGxlbiA9IGJ1Zi5sZW4oKS50cnlf
aW50bygpLnVud3JhcCgpOwogICAgICAgICBsZXQgciA9IHVuc2FmZSB7IGJpbmRpbmdzOjpxZW11
X2Nocl9mZV93cml0ZShhZGRyX29mX211dCEoKmNociksIGJ1Zi5hc19wdHIoKSwgbGVuKSB9Owot
ICAgICAgICBlcnJubzo6aW50b19pb19yZXN1bHQocikubWFwKHxjbnR8IGNudCBhcyB1c2l6ZSkK
KyAgICAgICAgaWYgciA8IDAgeworICAgICAgICAgICAgRXJyKGlvOjpFcnJvcjo6bGFzdF9vc19l
cnJvcigpKQorICAgICAgICB9IGVsc2UgeworICAgICAgICAgICAgT2sociBhcyB1c2l6ZSkKKyAg
ICAgICAgfQogICAgIH0KIAogICAgIGZuIHdyaXRlX2FsbCgmbXV0IHNlbGYsIGJ1ZjogJlt1OF0p
IC0+IGlvOjpSZXN1bHQ8KCk+IHsKQEAgLTYyLDEzICs2NiwxMyBAQCBmbiB3cml0ZV9hbGwoJm11
dCBzZWxmLCBidWY6ICZbdThdKSAtPiBpbzo6UmVzdWx0PCgpPiB7CiAKICAgICAgICAgbGV0IGxl
biA9IGJ1Zi5sZW4oKS50cnlfaW50bygpLnVud3JhcCgpOwogICAgICAgICBsZXQgciA9IHVuc2Fm
ZSB7IGJpbmRpbmdzOjpxZW11X2Nocl9mZV93cml0ZV9hbGwoYWRkcl9vZl9tdXQhKCpjaHIpLCBi
dWYuYXNfcHRyKCksIGxlbikgfTsKLSAgICAgICAgZXJybm86OmludG9faW9fcmVzdWx0KHIpLmFu
ZF90aGVuKHxjbnR8IHsKLSAgICAgICAgICAgIGlmIGNudCBhcyB1c2l6ZSA9PSBidWYubGVuKCkg
ewotICAgICAgICAgICAgICAgIE9rKCgpKQotICAgICAgICAgICAgfSBlbHNlIHsKLSAgICAgICAg
ICAgICAgICBFcnIoRXJyb3JLaW5kOjpXcml0ZVplcm8uaW50bygpKQotICAgICAgICAgICAgfQot
ICAgICAgICB9KQorICAgICAgICBpZiByIDwgMCB7CisgICAgICAgICAgICBFcnIoaW86OkVycm9y
OjpsYXN0X29zX2Vycm9yKCkpCisgICAgICAgIH0gZWxzZSBpZiByIGFzIHVzaXplID09IGJ1Zi5s
ZW4oKSB7CisgICAgICAgICAgICBPaygoKSkKKyAgICAgICAgfSBlbHNlIHsKKyAgICAgICAgICAg
IEVycihFcnJvcktpbmQ6OldyaXRlWmVyby5pbnRvKCkpCisgICAgICAgIH0KICAgICB9CiB9CiAK
QEAgLTE5Myw2ICsxOTcsNDggQEAgcHViIGZuIGFjY2VwdF9pbnB1dCgmc2VsZikgewogICAgICAg
ICB1bnNhZmUgeyBiaW5kaW5nczo6cWVtdV9jaHJfZmVfYWNjZXB0X2lucHV0KGFkZHJfb2ZfbXV0
ISgqY2hyKSkgfQogICAgIH0KIAorICAgIC8vLyBXYXRjaCBmb3Igb3V0cHV0IGJlY29taW5nIHdy
aXRhYmxlIG9yIGRpc2Nvbm5lY3RlZC4KKyAgICAvLy8KKyAgICAvLy8gIyBTYWZldHkKKyAgICAv
Ly8gVGhlIGNhbGxlciBtdXN0IGtlZXAgYG9wYXF1ZWAgdmFsaWQgdW50aWwgdGhlIHNvdXJjZSBp
cyByZW1vdmVkLCBhbmQKKyAgICAvLy8gbXVzdCByZW1vdmUgdGhlIHNvdXJjZSBiZWZvcmUgdGhl
IGZyb250ZW5kIGlzIGRlc3Ryb3llZC4KKyAgICBwdWIgdW5zYWZlIGZuIGFkZF93cml0ZV93YXRj
aCgKKyAgICAgICAgJnNlbGYsCisgICAgICAgIGNhbGxiYWNrOiBiaW5kaW5nczo6RkVXYXRjaEZ1
bmMsCisgICAgICAgIG9wYXF1ZTogKm11dCBjX3ZvaWQsCisgICAgKSAtPiB1MzIgeworICAgICAg
ICBsZXQgbXV0IGNociA9IHNlbGYuaW5uZXIuYm9ycm93X211dCgpOworICAgICAgICB1bnNhZmUg
eworICAgICAgICAgICAgYmluZGluZ3M6OnFlbXVfY2hyX2ZlX2FkZF93YXRjaCgKKyAgICAgICAg
ICAgICAgICBhZGRyX29mX211dCEoKmNociksCisgICAgICAgICAgICAgICAgZ2xpYl9zeXM6Okdf
SU9fT1VUIHwgZ2xpYl9zeXM6OkdfSU9fSFVQLAorICAgICAgICAgICAgICAgIGNhbGxiYWNrLAor
ICAgICAgICAgICAgICAgIG9wYXF1ZSwKKyAgICAgICAgICAgICkKKyAgICAgICAgfQorICAgIH0K
KworICAgIC8vLyBSZW1vdmUgYSB3YXRjaCBwcmV2aW91c2x5IHJldHVybmVkIGJ5IGBhZGRfd3Jp
dGVfd2F0Y2hgLgorICAgIHB1YiBmbiByZW1vdmVfd2F0Y2goJnNlbGYsIHRhZzogdTMyKSB7Cisg
ICAgICAgIGlmIHRhZyA9PSAwIHsKKyAgICAgICAgICAgIHJldHVybjsKKyAgICAgICAgfQorICAg
ICAgICBsZXQgY2hyID0gc2VsZi5pbm5lci5ib3Jyb3coKTsKKyAgICAgICAgaWYgY2hyLmNoci5p
c19udWxsKCkgeworICAgICAgICAgICAgcmV0dXJuOworICAgICAgICB9CisgICAgICAgIC8vIFNB
RkVUWTogdGhlIGJhY2tlbmQgYW5kIGl0cyBjb250ZXh0IHJlbWFpbiB2YWxpZCB3aGlsZSBib3Jy
b3dlZC4KKyAgICAgICAgLy8gTG9va2luZyB1cCB0aGUgc291cmNlIGhhbmRsZXMgd2F0Y2hlcyBh
bHJlYWR5IHJlbW92ZWQgYnkgdGhlIGJhY2tlbmQKKyAgICAgICAgLy8gYW5kIGFsc28gd29ya3Mg
d2hlbiBOVUxMIHNlbGVjdHMgdGhlIGRlZmF1bHQgY29udGV4dC4KKyAgICAgICAgdW5zYWZlIHsK
KyAgICAgICAgICAgIGxldCBjb250ZXh0ID0gKCpjaHIuY2hyKS5nY29udGV4dDsKKyAgICAgICAg
ICAgIGxldCBzb3VyY2UgPSBnbGliX3N5czo6Z19tYWluX2NvbnRleHRfZmluZF9zb3VyY2VfYnlf
aWQoY29udGV4dCwgdGFnKTsKKyAgICAgICAgICAgIGlmICFzb3VyY2UuaXNfbnVsbCgpIHsKKyAg
ICAgICAgICAgICAgICBnbGliX3N5czo6Z19zb3VyY2VfZGVzdHJveShzb3VyY2UpOworICAgICAg
ICAgICAgfQorICAgICAgICB9CisgICAgfQorCiAgICAgLy8vIFRlbXBvcmFyaWx5IGJvcnJvdyB0
aGUgY2hhcmFjdGVyIGRldmljZSwgYWxsb3dpbmcgaXQgdG8gYmUgdXNlZAogICAgIC8vLyBhcyBh
biBpbXBsZW1lbnRvciBvZiBgV3JpdGVgLiAgTm90ZSB0aGF0IGl0IGlzIG5vdCB2YWxpZCB0byBk
cm9wCiAgICAgLy8vIHRoZSBiaWcgUUVNVSBsb2NrIHdoaWxlIHRoZSBjaGFyYWN0ZXIgZGV2aWNl
IGlzIGJvcnJvd2VkLCBhcwpAQCAtMjI5LDcgKzI3NSwxMSBAQCBwdWIgZm4gd3JpdGUoJnNlbGYs
IGJ1ZjogJlt1OF0pIC0+IGlvOjpSZXN1bHQ8dXNpemU+IHsKICAgICAgICAgbGV0IGxlbiA9IGJ1
Zi5sZW4oKS50cnlfaW50bygpLnVud3JhcCgpOwogICAgICAgICAvLyBTQUZFVFk6IHFlbXVfY2hy
X2ZlX3dyaXRlIGlzIHRocmVhZC1zYWZlCiAgICAgICAgIGxldCByID0gdW5zYWZlIHsgYmluZGlu
Z3M6OnFlbXVfY2hyX2ZlX3dyaXRlKHNlbGYuaW5uZXIuYXNfcHRyKCksIGJ1Zi5hc19wdHIoKSwg
bGVuKSB9OwotICAgICAgICBlcnJubzo6aW50b19pb19yZXN1bHQocikubWFwKHxjbnR8IGNudCBh
cyB1c2l6ZSkKKyAgICAgICAgaWYgciA8IDAgeworICAgICAgICAgICAgRXJyKGlvOjpFcnJvcjo6
bGFzdF9vc19lcnJvcigpKQorICAgICAgICB9IGVsc2UgeworICAgICAgICAgICAgT2sociBhcyB1
c2l6ZSkKKyAgICAgICAgfQogICAgIH0KIAogICAgIC8vLyBXcml0ZSBkYXRhIHRvIGEgY2hhcmFj
dGVyIGJhY2tlbmQgZnJvbSB0aGUgZnJvbnQgZW5kLiAgVGhpcyBmdW5jdGlvbgpAQCAtMjQzLDEz
ICsyOTMsMTMgQEAgcHViIGZuIHdyaXRlX2FsbCgmc2VsZiwgYnVmOiAmW3U4XSkgLT4gaW86OlJl
c3VsdDwoKT4gewogICAgICAgICBsZXQgbGVuID0gYnVmLmxlbigpLnRyeV9pbnRvKCkudW53cmFw
KCk7CiAgICAgICAgIC8vIFNBRkVUWTogcWVtdV9jaHJfZmVfd3JpdGVfYWxsIGlzIHRocmVhZC1z
YWZlCiAgICAgICAgIGxldCByID0gdW5zYWZlIHsgYmluZGluZ3M6OnFlbXVfY2hyX2ZlX3dyaXRl
X2FsbChzZWxmLmlubmVyLmFzX3B0cigpLCBidWYuYXNfcHRyKCksIGxlbikgfTsKLSAgICAgICAg
ZXJybm86OmludG9faW9fcmVzdWx0KHIpLmFuZF90aGVuKHxjbnR8IHsKLSAgICAgICAgICAgIGlm
IGNudCBhcyB1c2l6ZSA9PSBidWYubGVuKCkgewotICAgICAgICAgICAgICAgIE9rKCgpKQotICAg
ICAgICAgICAgfSBlbHNlIHsKLSAgICAgICAgICAgICAgICBFcnIoRXJyb3JLaW5kOjpXcml0ZVpl
cm8uaW50bygpKQotICAgICAgICAgICAgfQotICAgICAgICB9KQorICAgICAgICBpZiByIDwgMCB7
CisgICAgICAgICAgICBFcnIoaW86OkVycm9yOjpsYXN0X29zX2Vycm9yKCkpCisgICAgICAgIH0g
ZWxzZSBpZiByIGFzIHVzaXplID09IGJ1Zi5sZW4oKSB7CisgICAgICAgICAgICBPaygoKSkKKyAg
ICAgICAgfSBlbHNlIHsKKyAgICAgICAgICAgIEVycihFcnJvcktpbmQ6OldyaXRlWmVyby5pbnRv
KCkpCisgICAgICAgIH0KICAgICB9CiB9CiAKLS0gCjIuMzQuMQoK

