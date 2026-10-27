Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C4B606A31A
	for <qemu-rust@archiver.kernel.org>; Tue, 27 Oct 2026 19:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oJIfwVJO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c2BXoeh7
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1xLnH7-0006AF-Mo; Tue, 27 Oct 2026 15:56:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xLm8h-0007Cf-5p
 for qemu-rust@nongnu.org; Tue, 27 Oct 2026 14:43:15 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xLm8f-0006YU-Jf
 for qemu-rust@nongnu.org; Tue, 27 Oct 2026 14:43:14 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69RIHqUR2960455
 for <qemu-rust@nongnu.org>; Tue, 27 Oct 2026 18:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qDDyDLGqcTb8IU39FxBKMoYtWWsXyFNnMFvBHhAGwAg=; b=oJIfwVJOBvtYsYVX
 DA+98vH04Obp4lHkh5IiHtMNQrb+iEcJdRNMV6SOfJXsx3Ou47EyPb0UCrKylaGF
 XlJe3SITaZHPT/cOw3WjH/eeMIBM4eKeo3edwiM8C1t5pCX7xwY9C/YirwkkeNOE
 cax5HY5q/ky+4apz/+PkSQl9ObgYquKBC85O9zAHy8GMfe5tjmMXxT//J9eyF1Qg
 UobSV6I0x8D9nXICKW/nu7IG38gGDE6hkN6+3fP2GvSoq1MgRtPA2OE5U+J+cGlT
 eri8w3pukSh1NFFV7JFnc6spIOf5Ks062vb5uCC4UCZyLzVla5vx7NKA4nAgG+yD
 0ILqKw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy670q4m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-rust@nongnu.org>; Tue, 27 Oct 2026 18:43:12 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id
 a92af1059eb24-19dbbe4b1d8so94162c88.1
 for <qemu-rust@nongnu.org>; Tue, 27 Oct 2026 11:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793126591; x=1793731391; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=qDDyDLGqcTb8IU39FxBKMoYtWWsXyFNnMFvBHhAGwAg=;
 b=c2BXoeh7HyuzKuRbyILDa4uQFpmpnVM2RQ7a/ds2VH1el/DJlDMBlK0Qi4w3fvvQmv
 XWYcAV03RhU68aNGx7eMdC6sIi/3njjrIeO/15Cfad7CKPwXuXkgzTFd3HtKRmLDvg1w
 q9RF6VHWJliQ6FJ5CqZEh+LnhuUy688CnbpzTYQthkPjRS9HWLn9ZELKOBm0nR/d5gTf
 6Ta5zkpcqYDTKeRivDbyaRI2GtS5whO6zDVnD70eqIESmPjKnbFD7nIvcoU38gAoXgZa
 haINprNNpCH6LOed8AXcWOsHW/lIoWYlvVB1Ujm5yRF0fzQWrTqyvhnrmfuuLxUKxlu5
 c/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793126591; x=1793731391;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qDDyDLGqcTb8IU39FxBKMoYtWWsXyFNnMFvBHhAGwAg=;
 b=WRxjU1tlefIBR7kCdPT7QZEKDwWFkzYWQZEbluQK+1716XwpMauya/0I2EsBQg7c3A
 ruN/G3pwfjkQpjKG8XX3r1F3JCbKYPf1xg6cnH7wirmeavnM4I/0+txtLPySgrX4paUf
 d/BQXQIC7XAM+JJHq6k3FH+VJuOh/MWAWLZRcG1JBRf4OTT7t1OlJ6FReWDnmF7F0lKB
 yA8XsHLB6vq5RWkyr96AV0l1j3gXNsBn/kDlUEdLqiAhffnQYdB+YCq2j2ufMhMbn7Rb
 pbt00rTW3sVwNR3cACn8/cAnD6mIwGiTwVVnvrmcZgiaLtmqabv2QJAoy7Q5oc/O7gQc
 FimA==
X-Forwarded-Encrypted: i=1;
 AKwUvByUFTx/TKaHTfPAJ/xtGatqrEilWjg1ZkMmFcHmS84S+pQ5NimCgSLL+7oJNUsUn3a3lKrbEgy2gcY=@nongnu.org
X-Gm-Message-State: AFq9FYKI9acM8I4KFWDV0DtoMXJTSbZb6rHSybqDWSnvzGfxJOwL4I6Z
 lPWhKp+yGndmaiDXwSCg7qZvC2wqSg0ffz0FxOuizTXGDH5yKxtHd3m3lIYnDYz8nYN77r5wf97
 LnYFKCjVnfw6+SNnYB6T23p6LEwxHlzoCjCgWw7aKX9BgcqizP9AmDPQ2
X-Gm-Gg: AYBFou2Acvf6mK00nIulcq+9PyVkIDGx1KhM0SBqM6KJsefMt7dCmfXDi0KNdC3iZNy
 rVTcbRlC3y8LVRcOhmXqlSgfM3l1OEWObbgxhVcb6EdzqgY7zwP93tDnd1ryJfWRs8QRhoqVpSu
 s/YSzSrd2USXq+TQzwTLUZZ4LJDJBSfO9gjbYKR/XZ+DvYT/YGOob/gWFkEunXvInFpl+BpR+59
 b3JIH1GT2lGEKo6eKIKXrE754TBpyoJZborgYQumu7EeVYbrp1ez6AYKBcIXVf2Igp3P1eaMFN8
 yGr3YpFU1haHw1N2QqH+WbdHI1o3CqzTP/bgn+D8IbapUsRGMKpwQaVh7JjQ8ZYGLotVjNJaRoK
 AHYncizeyndX8gIN0p8vRtuj6PE0EyX2eylitZ11Wbe0glk9awoZh25xq+r/NDP0a1HtMKA==
X-Received: by 2002:a05:701b:2515:b0:151:94a6:6f5f with SMTP id
 a92af1059eb24-1a6cd3a138fmr102065c88.10.1793126591133; 
 Tue, 27 Oct 2026 11:43:11 -0700 (PDT)
X-Received: by 2002:a05:701b:2515:b0:151:94a6:6f5f with SMTP id
 a92af1059eb24-1a6cd3a138fmr102027c88.10.1793126590408; 
 Tue, 27 Oct 2026 11:43:10 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36a002a486csm20740628eec.22.2026.10.27.11.43.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 11:43:09 -0700 (PDT)
Message-ID: <c47cf1a7-15ba-46bb-8579-1b5a2367f2fd@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 10:43:09 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] hw/misc: QUP UART device
To: Brian Cain <brian.cain@oss.qualcomm.com>, qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-rust@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20261027183823.383806-1-brian.cain@oss.qualcomm.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261027183823.383806-1-brian.cain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sbMGXOvA9ev8hRI8doa2CeYeFDwDpP2H
X-Authority-Analysis: v=2.4 cv=QvfLTlyd c=1 sm=1 tr=0 ts=6ae0f0c0 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1fEj3FehfFSb209yl4QA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3NCBTYWx0ZWRfX5rkRWW0fQBT8
 zj/Ecs4AUqgP7eze2d1NzThZfvSB6u0QUQJJYg5Zm4VEzoEv0K5TwDB9aULy3w2DPTqN5gmTn8R
 +ws5f/JX3697VM0DQSjpImSWZzxn2TA=
X-Proofpoint-GUID: sbMGXOvA9ev8hRI8doa2CeYeFDwDpP2H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3NCBTYWx0ZWRfX5x9nSZ1SXA7c
 Abq4DF7qONQ6Yda/3XPxH5ooTwOH/SarYBgWx63caZDRrpFK62GAwPB7vEMxHO+uitTSGMrwFsI
 ULcMm52okwnleHmHxh7bzODpwGSRP0v+ZmYnPe8OZF9fcmx5AfvTnL01SD7hKGAxqp7mtrXyh9Q
 Ttc8Q3FV4TBcll8lMDYuvQORSpTgWzjPO/ks4YU4/RnqQa9f/kEiFbDsXDMsl7/7s/Ks/QnsJP3
 dBBFelSbjLAO4gk7L909KONs+SaanNrMLx6dWzSAk6ZPqJ4irLJq46Ex2q+QjJ6U6rRlTY/68LD
 4KJKiW/7y4wRzofnzmtf6Fzpj45aWCXZR2LpHZjX+u5N9fGaSeu2vbQfOivL+grsF2AAX42kLz4
 jEgNFg1MUeL7llO0q98hpx1uZGqhf0ZlGJqvrc2ak1uC7X41Tdqe08C6F41u1WpQfa42f4XLjJP
 fJBsqtsPamlW+vwaQ5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 clxscore=1011 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270074
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, KHOP_DYNAMIC=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 27 Oct 2026 15:55:56 -0400
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/27/2026 10:38 AM, Brian Cain wrote:
> Add the QUP + GENI uart device models.  The QUP is a "Universal Peripheral"
> present on Qualcomm SoCs, with connections for SPI, UART, I2C, I3C.  For
> now we're only interested in UART.
> 
> Will follow up with a v2 including wiring into machines + qtest after
> https://lore.kernel.org/qemu-devel/20261027143721.4125584-1-brian.cain@oss.qualcomm.com/
> lands.
> 
> Brian Cain (3):
>   hw/misc: add the QUP wrapper device
>   rust/chardev: fix write errors and add write watches
>   rust/hw/char: add QUP GENI UART device model
> 
>  MAINTAINERS                                 |    3 +
>  docs/system/device-emulation.rst            |    1 +
>  docs/system/devices/qup.rst                 |   10 +
>  include/hw/misc/qup-wrapper.h               |   27 +
>  hw/misc/qup-wrapper.c                       |   90 ++
>  Cargo.lock                                  |   15 +
>  Cargo.toml                                  |    1 +
>  hw/misc/Kconfig                             |    3 +
>  hw/misc/meson.build                         |    3 +
>  rust/chardev/src/chardev.rs                 |   82 +-
>  rust/hw/char/Kconfig                        |    4 +
>  rust/hw/char/meson.build                    |    1 +
>  rust/hw/char/qup_geni_uart/Cargo.toml       |   27 +
>  rust/hw/char/qup_geni_uart/meson.build      |   28 +
>  rust/hw/char/qup_geni_uart/src/device.rs    | 1293 +++++++++++++++++++
>  rust/hw/char/qup_geni_uart/src/lib.rs       |    9 +
>  rust/hw/char/qup_geni_uart/src/registers.rs |  160 +++
>  17 files changed, 1741 insertions(+), 16 deletions(-)
>  create mode 100644 docs/system/devices/qup.rst
>  create mode 100644 include/hw/misc/qup-wrapper.h
>  create mode 100644 hw/misc/qup-wrapper.c
>  create mode 100644 rust/hw/char/qup_geni_uart/Cargo.toml
>  create mode 100644 rust/hw/char/qup_geni_uart/meson.build
>  create mode 100644 rust/hw/char/qup_geni_uart/src/device.rs
>  create mode 100644 rust/hw/char/qup_geni_uart/src/lib.rs
>  create mode 100644 rust/hw/char/qup_geni_uart/src/registers.rs
> 

Any specific reason to have this implemented in Rust?

Not a bad thing in itself, but it means it's only available with rust
builds, which can be a problem if a machine defined in C wants to use it
unconditionally. Rust is not (yet) a mandatory dep for QEMU.

Regards,
Pierrick

