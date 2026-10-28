Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3796D606A31D
	for <qemu-rust@archiver.kernel.org>; Wed, 28 Oct 2026 07:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aFfwNPq8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tsgyr2qf
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1xLxhd-0000Wg-R4; Wed, 28 Oct 2026 03:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xLxhU-0000Vu-UI
 for qemu-rust@nongnu.org; Wed, 28 Oct 2026 03:03:58 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xLxhS-0008QN-Po
 for qemu-rust@nongnu.org; Wed, 28 Oct 2026 03:03:56 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69S6FCeb4171095
 for <qemu-rust@nongnu.org>; Wed, 28 Oct 2026 07:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xRthz2x/+bhwmNJmyf+SsJrR6PwpbO0anL/USUjEnRU=; b=aFfwNPq8skh5KjvW
 Zxl9f+RdNBQJFup5toz/rEeVjGMB1AKxsDifCeBcBGyhn++V2tNzIpes60ow5VtN
 /+kWmHlKWpLQaISIOmRCuC+K54Ydj/REAdz3zDs1YlrErmd5Hbegw6uOPmfHssN/
 sq1gsd0PvtjWBX+SJV4pXsM9pLBWTp0qtjNxqfdYbbX/cfCjCADF72ENg3cJrLgS
 y3q+h/KVg9kJOX1Ka/tvtSP08RxteMR7oG6NEfQ2kVl6s2CtGD7KbNiN/5nPd7a3
 havHhdM42w4LLleZ4AEjLJJaOkeaPzIttqA2kXJ3Rz7IIaAjY8OdMiCk5hdejcOE
 cvHAYA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be183q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-rust@nongnu.org>; Wed, 28 Oct 2026 07:03:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93f62934ef6so132215785a.3
 for <qemu-rust@nongnu.org>; Wed, 28 Oct 2026 00:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793171030; x=1793775830; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=xRthz2x/+bhwmNJmyf+SsJrR6PwpbO0anL/USUjEnRU=;
 b=Tsgyr2qfKWBM0NB5Xlc0TZNM/Sv1HcqiubFYjbJ6p4OuDHc1+oTlQE0ozuSj+x9n1Y
 OKbqTx7RPeexDMgbyLCMCESxLc8N4E3i8V/SbRA0kuUG6ZD3eeqscjWc2qdHvLVAPZS5
 bOgWNXd/vByijJW0zozIb2Ob+XwbWfpu5K47N0KAiMbB29DKC/73KDKGEf8nbWTLnkK5
 6ojG8x89on+x0MmU2j+hcPLj+zjxFLZ7EIVLBfEQgNmrdBCyfyfG4N8nLPoieSrQxGhH
 dn7xhREHQOekYJ+mT4FDUbccgKyKS4DOiiBqbuZGWlaO3KXJaWrbIXtgrlYSesIKoNkv
 jAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793171030; x=1793775830;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xRthz2x/+bhwmNJmyf+SsJrR6PwpbO0anL/USUjEnRU=;
 b=fVdQxigxJC2gSMYljKV8MJayRjKKcmb6mC6syp6BKNWQOra4/53GzTdYinUuidcldU
 5EvP5N56H7PP2XtyChdGYRxhXpmd5tEShywrc2vAaaS7zJYBHCZTdEOfsjM8r3MH4X8J
 C8nmdjCRJ/+J/QCFJlPMrpmB9fi8dvoPpJKjOkZlgi2QAzPhRllhpojk/rPAvGFuPBiG
 r2CqSD+IraizW3zB2pIBrxvkHeCB77AorZbKos+aaRQSHj2XQ5MJpPQYWUwBodam8QuP
 BLcDS9ObahtblZx2zfWWRyK5HQnrb19C73j6ys4ttBRTkfHYC93z6QtLaLCXmSdGy73V
 TSJg==
X-Forwarded-Encrypted: i=1;
 AKwUvBz/sfvqZPX2AxTvFvMRlwW25NunRZYCgqdKHAwWbD7LTd44uuRGVPioEslGC/2VsaXHil5IbNDAyqo=@nongnu.org
X-Gm-Message-State: AFq9FYJTbv2k/JPW49c11VJAa3a8ATN68MDooTs008CHeCMDlkPARhIc
 QvEmB4wK+RZHqCowQdUZ0Qqbo2YHypbKk5YE1Tztxdvojjvkbsnu/iyA2q1Iw/lmkWMcssWHqD9
 Ld0vfLCIwNSz9A6uRbJXVfK9q+UcQ60KKhA9K1ZjOqzP2iYisUpxwd5Tp
X-Gm-Gg: AYBFou0dYTw69/cm1obmfU83j+6PIdTml+OBAoBwEF7XIwxL8CmmsAGQ2CoXGkMZ6Fy
 60yx/09IPehyRiiWWDltFGnYFwMGbq+E0uVzCigFgPQfhLfNF+MFCstp3/Re+KA5raBpSl9HLLh
 PQZVVM0hxjHNmkeqtelqgBCoPU9jrlWW0S8IrqQsRpM/XOXs954gLuqfAhP7CoyLXipgB6bLCok
 ioBnoErkwbku3rNYnsB1E3GDo/wK6cusB99LL5e5A22eCs+EcW4AtEygyYdAXUVus36Su0My+wF
 Evg/HfCRsz3SXdXq6Oya/OYFSHAgpwhUJ4x8Cvc8tzlttUI22TK1hnQ0q8k4qYHL7vN35u0Ig2k
 i9UPEqKqxAwdlPRGMjCB1RjOoSdzm9iqa4tI73Dawzq+evlZDc9XT1CKdhJ7Zo93N95qOBFxert
 QIUylC1uGFcnwSLIE1kpqcyqk=
X-Received: by 2002:a05:620a:2a14:b0:93e:66e6:fa4 with SMTP id
 af79cd13be357-94408cf36f8mr189103985a.16.1793171029730; 
 Wed, 28 Oct 2026 00:03:49 -0700 (PDT)
X-Received: by 2002:a05:620a:2a14:b0:93e:66e6:fa4 with SMTP id
 af79cd13be357-94408cf36f8mr189102785a.16.1793171029337; 
 Wed, 28 Oct 2026 00:03:49 -0700 (PDT)
Received: from [192.168.69.229] (82-67-153-177.subs.proxad.net.
 [82.67.153.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a97c9f1403sm25392275e9.9.2026.10.28.00.03.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 00:03:48 -0700 (PDT)
Message-ID: <54c73c71-6ad7-47a9-98e6-893aa1b9e6f8@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:03:47 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] rust/chardev: fix write errors and add write watches
Content-Language: en-US
To: Brian Cain <brian.cain@oss.qualcomm.com>, qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-rust@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
References: <20261027183823.383806-1-brian.cain@oss.qualcomm.com>
 <20261027183823.383806-3-brian.cain@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261027183823.383806-3-brian.cain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: LP8kPy3mGQuSgWFetN32upSgobxOA8l7
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae19e56 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=iutzSQcAoqjh_2YZnUMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAyNyBTYWx0ZWRfXxCvOj+RmNG9M
 7mxeXTY7BAoxSHWSAIT0TRGsPWWmRAKX1s0MgU9bRi8BdsSoSpzTtydM8OH5ymsaIC4S8kk5U98
 m2UmUXm2iUrHKjBPnBVesC2oevGlxxM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAyNyBTYWx0ZWRfX3AV8eysMedwZ
 eXvbXj13Y96fk8oD2e7NlCsiPKMS1Rr04RSsUPwOOTbT88F20t5sPsX1s5f9Qj9Qr645LGTcsjA
 adplf3P6VCJMAfpZXtof0t6CQi25NVT/RX8jqV1+7dJilpaRsosRCMtcHsZapAfoZyrEL/4T2SB
 fWZKNc2txr3Bf0FZzYSm/zpCMLOcznGD23ZgOjlbvE1OCJyI6Ec1yRVYtQoE1ZidPprhRlyvd69
 Gqm+89y+ZFUEG3POE4Q/xfO4gfehK6w0cZ3JB0qlc/5ugXWmi3f7AeMXRdNPclmJEj7RixswwPK
 1wcsfkuW2SGKPKxyX9ELYQ6kzgJiGPT28N2IRnCPLNmZTAjEk/Y9pOHeYeBI/H+yyGHXlKFeMVl
 1UXqneaf6WKUo/9AXshjDufg42gMyRt7ImX01gNCe9AZSAEvUT0tjRCAa2sZIZzsbV/dod6Yxh5
 aT/SQQ+t6m9sxHWxNhw==
X-Proofpoint-GUID: LP8kPy3mGQuSgWFetN32upSgobxOA8l7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280027
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, KHOP_DYNAMIC=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27/10/26 19:38, Brian Cain wrote:
> qemu_chr_fe_write() reports failure as -1 with the cause in errno, not
> as a negated errno, so errno::into_io_result() turned every failure into
> EPERM and a frontend could never see EAGAIN.  Build the error from
> errno instead, in both CharFrontend::write() and the BQL-free variant.
> 
> Also add CharFrontend::add_write_watch() and remove_watch(), so that a
> device whose backend would block can retry once it is writable again.
> remove_watch() tolerates a source that the backend has already torn
> down.

Please split as 2 distinct patches. With that:

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

> Signed-off-by: Brian Cain <brian.cain@oss.qualcomm.com>
> ---
>   rust/chardev/src/chardev.rs | 82 +++++++++++++++++++++++++++++--------
>   1 file changed, 66 insertions(+), 16 deletions(-)


