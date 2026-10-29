Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716E3606A31A
	for <qemu-rust@archiver.kernel.org>; Thu, 29 Oct 2026 00:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cYGsK+Ed;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HwOoZ7PR
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1xMDtV-0004YL-DE; Wed, 28 Oct 2026 20:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.cain@oss.qualcomm.com>)
 id 1xMDtP-0004Xs-QB
 for qemu-rust@nongnu.org; Wed, 28 Oct 2026 20:21:19 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.cain@oss.qualcomm.com>)
 id 1xMDtL-0001am-UB
 for qemu-rust@nongnu.org; Wed, 28 Oct 2026 20:21:18 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69SMAR922428612
 for <qemu-rust@nongnu.org>; Thu, 29 Oct 2026 00:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nkkYXC5p6lGl4uzjt0PXOrSPF/3webam7xmRKJgWzlo=; b=cYGsK+Ed9HF1m4ZS
 nWMypZO2c1YboT9j6uxf2yegEgQXZJgu+LyoyuAezWDLfOqdYuJIFTSFZaByWTMZ
 Mb3seMDVhfu1aAcE16oC6Pm3ctz5bbFcSr5nVOMfrMzdco2nRfMIFjs7PzTA/F3d
 WhLGF46fMiMkuDm/uR31blArsECPXQmd2ne9fa5TqAI039e0wlisqYotovQn6DFS
 z9l7yD4K6gLjSirL27adpdv0XzNKatY0zoCk8MD9aIEAd8JpbP4YtFo6a/HQCk0Q
 AJceL/8e1Cgk7U50vI9zF6LlMYi79NZAkZFcuH5zmlE3HFRxI/kpe4piUeXBzV8P
 wR2DUw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhwc3uq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-rust@nongnu.org>; Thu, 29 Oct 2026 00:21:12 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-91c70349f65so34472146d6.3
 for <qemu-rust@nongnu.org>; Wed, 28 Oct 2026 17:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793233271; x=1793838071; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=nkkYXC5p6lGl4uzjt0PXOrSPF/3webam7xmRKJgWzlo=;
 b=HwOoZ7PRdfR6XxBH0MArG5ad2yY+gkj14NYOIlCI57MvdsaBFZGUYy3nZ/yx4jPj6Y
 gTxkNFXKkBlJwqNAsDh/2q/GsSxaef1r5noK9H/kjKjnugXyqG7LBUz5F3s9CD/hqhF3
 2bqnsi4sYSg8ZEDqK8xVoethwXDefYap52DWi4L3MNlAS5gdtBWp4NZBSKlk6FIgZlDg
 U6xl1Tk8BHb5kSioeVkbKg2Ms7K4JngHiDUxF5uk04ah8kfu8qVs4yjAhUJai0KF0ywu
 Ycakg1//d9MXXaPThxpegPR/8EHw5RdgwpuU4QRoNJ+fqb0D4dQX1uJGsZVmg9Jp6oFr
 zq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793233271; x=1793838071;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=nkkYXC5p6lGl4uzjt0PXOrSPF/3webam7xmRKJgWzlo=;
 b=FzlCv/jigm04r0g9s4DX2ONm7w6M8qrzhT/z5hQmEqskT+Sd1m7J61r9YClsbFD+OL
 eZCRuRz8NiQ+xZ/gC1DhXR3MeTHisBDF1913nYAJx3Oz6vlEb0xV2SNd6DZor1/2xmkK
 aKn/MrbmR6dlOhvWKTG+gL4CHbE0MnEdfbCGXr1schuykRDTnVqpv/1EsFWLLFtNA0jO
 ZpqasEf+n4UbPH7ih96oKznqPkXKf3I8H4M/MLTxTkARGLSuPD/OUyqRi7NMVfsIsyvF
 Xc9RkCeDIN9yyXqKbR8L829evgsa4jv2v1jOLm/yeNOfPh7LGsh+wued880i0bOCCn0T
 opqg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwW1KponRXcPLkynzfkVWfXbdLt2lCLrrLyB4uPx8pk8WimoY0G89BKn8Bu43TiuwwYxJ9tm0jtqok=@nongnu.org
X-Gm-Message-State: AFq9FYItE86WUMUlEgbA+LLOcuh9RB50j3rfevG1vbpZU6oIGTfOYvWX
 ukpA4Pwl6rdfJ8dEvlW7EK2LPwEcKX3QDBTiULNjGUfnpJOHAvb7awUoCeGE9wy83N03+9P5wW/
 WVUvNZq7FzLhO3T7QDfa5hw1ALNilqCMAo5KvFd0yTGnpj75qCSM1YcCM
X-Gm-Gg: AYBFou2pCLojwf/nfN+BPkMLJ631+AVh/zS7iO7tabftyZJ1Cf7Hm89a0RGdlRJIxOe
 ++m8b5+kYQURZld/uMDoWl5eog3AE+Fse04jyDnAOIVmFleW5CmcbLGf0Vhvs+K2XI17JtRPNJy
 zxVnRC3IMrZkb/BXaAREPxKsOnR7WuNOAzxAuzeH3VbbRKbjyEAvjuP226iaMnmaB2oK1dW9hGE
 lDIQVjfSoClSsekFq8Pp7jx4RsETEpFDqS2q6ypbSnT3ncWlvkauhX4flD4xvlghrYNXwUs37Z0
 mgv1pYAzbn4aSMzjQCVzIAvN59Dpm5TV/oyqtB58MI3LQBbMkOiRHAvmlS+oBgfKGG5VxSAxXIZ
 /6569ZXK0zUYgrIz0vQaX87/1/CV/Jw9gV0RoKRMt0NPYPexHG/BBlPln+r2FfMzJETX2mspmB4
 av/jNs1kUoV0Z27M7K0i2xb3o5eRHgtRb9Qw==
X-Received: by 2002:a05:6214:8617:b0:91c:711c:27f3 with SMTP id
 6a1803df08f44-91c7cf4a0eemr68083766d6.21.1793233270907; 
 Wed, 28 Oct 2026 17:21:10 -0700 (PDT)
X-Received: by 2002:a05:6214:8617:b0:91c:711c:27f3 with SMTP id
 6a1803df08f44-91c7cf4a0eemr68083436d6.21.1793233270328; 
 Wed, 28 Oct 2026 17:21:10 -0700 (PDT)
Received: from [10.248.104.162] (208.sub-174-237-64.myvzw.com.
 [174.237.64.208]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c7db3dbcfsm32896346d6.38.2026.10.28.17.21.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 17:21:09 -0700 (PDT)
Message-ID: <c980adde-e156-42b2-8cd2-3dae45e54feb@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 19:21:06 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] hw/misc: QUP UART device
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-rust@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20261027183823.383806-1-brian.cain@oss.qualcomm.com>
 <c47cf1a7-15ba-46bb-8579-1b5a2367f2fd@oss.qualcomm.com>
 <916816a7-a1ff-4c5d-805c-6cacad6c95f2@oss.qualcomm.com>
 <59fa861d-a909-4b60-b1a2-c6f6eebc51fc@oss.qualcomm.com>
Content-Language: en-US
From: Brian Cain <brian.cain@oss.qualcomm.com>
In-Reply-To: <59fa861d-a909-4b60-b1a2-c6f6eebc51fc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CVIMpuXf8JQkaV8mPAcKg89HMf7i-vNg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAwMSBTYWx0ZWRfX50u4zVoW6cla
 3S907p/gcLFHoDTgAgVPpsLvwO0sepAldnSCh1OtrYIgHUz0l7tXNF5W3Z3J8bdrncFoFygIcAZ
 4dyd7OPSJnbIirdek/rOf2pzKzhhOs0=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae29178 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=jff3rsGav0cYookgkwt1wQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DHpt-Luc1n_jbodHyxMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: CVIMpuXf8JQkaV8mPAcKg89HMf7i-vNg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAwMSBTYWx0ZWRfX95TjAX9aFQaA
 KKW3fBbw+8bmiYx5cdWrSjMMw8K4fZfnd3xHr/QUMFuEZcZukKyoB/71x2Z6JdfK3FZr4AoiIuz
 jvOEFB7FAUPo7hVo9Xml6uBNNbrKcbqfSTotkye/xPJGcT2VG9zfyvk5V9ewhJ9Ejv0lsRWfbym
 Q2jE91uEk4hryEc9rVsbFjNvyHJNKH2UrSr7COerwiLWP2TbvZ1G1pL4TSSduCq6o0DFZE8FFLf
 6S1vQrWVyzzv/hxseHSaBPApHPxeJ+s7p84yzl6EF6UftD4EjTxi/EROhZMXqiscdBF+4U38qYb
 J0AGcw5ER0AE5WlUZqo3Bg/+5MrPkjB3d3bM1uXF4W7DKsRbfJg7D9ZibGZDLMoh1kVwlac7jIW
 v1jDnGWDwKyMsnaCZ+YhupEVlVj2QHISGyU3beq/D9hKWhTwzd+7a8zHUKmBPbvMRHq69ynPcA1
 XgC5dcTrRnF4PMb0eTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290001
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=brian.cain@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, KHOP_DYNAMIC=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/27/2026 3:12 PM, Pierrick Bouvier wrote:
> On 10/27/2026 12:02 PM, Brian Cain wrote:
>> On 10/27/2026 1:43 PM, Pierrick Bouvier wrote:
>>> On 10/27/2026 10:38 AM, Brian Cain wrote:
>>>> Add the QUP + GENI uart device models.  The QUP is a "Universal
>>>> Peripheral"
>>>> present on Qualcomm SoCs, with connections for SPI, UART, I2C, I3C.  For
>>>> now we're only interested in UART.
>>>>
>>>> Will follow up with a v2 including wiring into machines + qtest after
>>>> https://lore.kernel.org/qemu-devel/20261027143721.4125584-1-
>>>> brian.cain@oss.qualcomm.com/
>>>> lands.
>>>>
>>>> Brian Cain (3):
>>>>     hw/misc: add the QUP wrapper device
>>>>     rust/chardev: fix write errors and add write watches
>>>>     rust/hw/char: add QUP GENI UART device model
>>>>
>>>>    MAINTAINERS                                 |    3 +
>>>>    docs/system/device-emulation.rst            |    1 +
>>>>    docs/system/devices/qup.rst                 |   10 +
>>>>    include/hw/misc/qup-wrapper.h               |   27 +
>>>>    hw/misc/qup-wrapper.c                       |   90 ++
>>>>    Cargo.lock                                  |   15 +
>>>>    Cargo.toml                                  |    1 +
>>>>    hw/misc/Kconfig                             |    3 +
>>>>    hw/misc/meson.build                         |    3 +
>>>>    rust/chardev/src/chardev.rs                 |   82 +-
>>>>    rust/hw/char/Kconfig                        |    4 +
>>>>    rust/hw/char/meson.build                    |    1 +
>>>>    rust/hw/char/qup_geni_uart/Cargo.toml       |   27 +
>>>>    rust/hw/char/qup_geni_uart/meson.build      |   28 +
>>>>    rust/hw/char/qup_geni_uart/src/device.rs    | 1293 +++++++++++++++++++
>>>>    rust/hw/char/qup_geni_uart/src/lib.rs       |    9 +
>>>>    rust/hw/char/qup_geni_uart/src/registers.rs |  160 +++
>>>>    17 files changed, 1741 insertions(+), 16 deletions(-)
>>>>    create mode 100644 docs/system/devices/qup.rst
>>>>    create mode 100644 include/hw/misc/qup-wrapper.h
>>>>    create mode 100644 hw/misc/qup-wrapper.c
>>>>    create mode 100644 rust/hw/char/qup_geni_uart/Cargo.toml
>>>>    create mode 100644 rust/hw/char/qup_geni_uart/meson.build
>>>>    create mode 100644 rust/hw/char/qup_geni_uart/src/device.rs
>>>>    create mode 100644 rust/hw/char/qup_geni_uart/src/lib.rs
>>>>    create mode 100644 rust/hw/char/qup_geni_uart/src/registers.rs
>>>>
>>> Any specific reason to have this implemented in Rust?
>>>
>>> Not a bad thing in itself, but it means it's only available with rust
>>> builds, which can be a problem if a machine defined in C wants to use it
>>> unconditionally. Rust is not (yet) a mandatory dep for QEMU.
>> A new device model -> a brand new day -> a new frontier?
>>
>> It was an interesting challenge and seemed appropriate given the nice
>> reference pl011 device.  But I will concede it can be impractical.
>> Making this device conditionally enabled in the machine that uses it
>> felt kinda "lame" and made me long for a day when it *was* a mandatory
>> dependency.
>>
>> Seeing as how we have a pl011 device in C, maybe it's better to start
>> with a C version of the QUP?  If so, that's okay with me.
>>
> If it's a mandatory device as part of a machine definition, it would
> probably be better to stick to C for now.
> I hope we can get Rust as a main dep at some point. I'm not sure what is
> the criteria to do this change, out of deciding "let's do this".

Hmm - so ... can I put in a vote for this, then?  Can "at some point" be 
now?  What are the criteria?


> Regards,
> Pierrick

