Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A1D606A31A
	for <qemu-rust@archiver.kernel.org>; Tue, 27 Oct 2026 19:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TzJb7lha;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NnOHBrV0
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1xLmU6-0004bo-I2; Tue, 27 Oct 2026 15:05:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xLmU4-0004bS-EP
 for qemu-rust@nongnu.org; Tue, 27 Oct 2026 15:05:20 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xLmU2-0000It-Fk
 for qemu-rust@nongnu.org; Tue, 27 Oct 2026 15:05:20 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69RIHRsD2997824
 for <qemu-rust@nongnu.org>; Tue, 27 Oct 2026 19:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 45vmp1ssoi1klKZ2hb22+gEefnvbpY9FKmBFUSpyP9U=; b=TzJb7lhaRzbHPrfB
 pxLUtuLjxtGkTpk44UXaj2yHzFCa2Bmb17y5y6FBzeU3hn40P77if6LUKI96abiS
 PREnmw1paawBOVTbF03hBkCb7iMPO2AtfFswf15dW6X2YJtoW2lqbikhCuQP7cLk
 vU6WZXcRRTU28n2xqEc4ZW8+dZdPgCTGPhxpc6IP488JfPbxQMri7HqqAqA6IIl0
 pfCR497LaKG2I6HR9cEQ8CfJftc40TeLnipZisY5cDFEYyKM3McE38LVCgDkTlgf
 03KualuHT3GY28ZXG6KmxAiIIhOXeVxsYv2A/yA1ctELMqzcltVYEfzobpgQJWfX
 E2jGTQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1ja3s-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-rust@nongnu.org>; Tue, 27 Oct 2026 19:05:15 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-5eac2cf3905so82240e0c.1
 for <qemu-rust@nongnu.org>; Tue, 27 Oct 2026 12:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793127915; x=1793732715; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=45vmp1ssoi1klKZ2hb22+gEefnvbpY9FKmBFUSpyP9U=;
 b=NnOHBrV0jgJRwN0cQzb1V/hQc69A6FHVyfqQSZ2YW8FpSiCiEsilQaj4eRbuXFljzR
 RfxEOUOY2jw7HIcE2cfVeIPk9U2Zls0r+fjWsNgk0WWNGiOvjMINp8BYVmVDXYl7BxyI
 4Qmd80Rnf19d2TW/bLjfo0sFaiMOQfVwHKNPbql04d8OsQTXw3E0qQsTalpH2UHxTUbD
 D4sqyZSRdOWcvo6cIb5O5KCxOy2g181VV8+N5Fk0Q95YO7rTuHABvqLpuwfCEvskMxd9
 0m+sLYRTuhmPlFKOoKhSYqaeThmuWRr1Ug+HC32ih1ISh7hpOwCkzGuRHyU0bNfhQXJG
 utcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793127915; x=1793732715;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=45vmp1ssoi1klKZ2hb22+gEefnvbpY9FKmBFUSpyP9U=;
 b=GN3DYsOiMsZQVZWUF5Jrju0bWbYoSv0TJv9AzKAlkinuYQ72YqaNfxOD6e8kfZLAdW
 IedJEHr+FMov+Z2mwg46fEm1XHAOOaVHg/yBuUfgm5Ml6GD60QWpXeGXIscx/WzoZAYv
 Iuacf0noOg3sJYamoE3uZ/PO1AuyL3uO1Iikjmg4RoFQBQ5WSDSTscWyhMZbfbm0zVXz
 TGePgMntqZKAWmfx5btg+WdrubYlAozU7Y2IQhn+NC3jZr5/xH6zEb2kzWCMiSq1CTbV
 fTK0kOoOZVI2oitzJa8he+8cy2cA2FADHtqGqT4DN5R3m6XWXnojAJfGshNepaFlixKp
 wPfg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxiBbVkaNWpuZNFE7NfN3k7v4zLVEoxZKu5rJyGlxlf+Wvth/jsbuLyVwHFRSBmV/0TDMrbTwGi2D4=@nongnu.org
X-Gm-Message-State: AFq9FYJbhFNIxVPAFB9IMEfEXEF0O9efD6Esj4ZhF9/EXIhtZfNNwypE
 lFUh54sLpOBm442Ktm7Z5UjEzB+JmV8pFwLfsYrR2IUL0VTs+ttfYDCd91QdVOFs4rcCChkWsty
 oUtZ0ASrxXwuhs66DkhK8jAcJsIhgkyT8LT48ehZZHa2QteLzIR3/TZND
X-Gm-Gg: AYBFou16tBV/dgXy7YaZltQkTUPKfk6ixylklgCEdh7kpGjU+OQ9EG7/LmyimL3WoWM
 JwaLX6E42cYbcfOcIWGqbt+P8wYn4h1HwftH8n0KPVl3k7p7/c3ur16FZdG5qzzBc+cfdmt2u5c
 5+NTQ7ElJIT+491q4rpNHX91r1giIpIuMlCfMB3vecGJ6lbpo93BieMPyHfjk8n7dCzxVmTGqk+
 0V6LgrdviAiMj+RKjmJMKturLrfiYtGRnXdF4tzYd/1TpHK9SooL4TjqfkKYF/HU5Gcpmj4/p1m
 HKc35K5r1EavWnpt/6IPOUjqsmHJMsjTjdAlwJX1uP2UC7cEkJevF8puSJwOUZZ2wKDeERzFMbf
 YXeqclQFHgi9MkQbeIjMz7ed8OV1wd7OpIhJgYtIdKK5qJIPHhQ==
X-Received: by 2002:a05:6122:894:b0:5ea:f220:fd6e with SMTP id
 71dfb90a1353d-5ec4cc889famr57892e0c.11.1793127914663; 
 Tue, 27 Oct 2026 12:05:14 -0700 (PDT)
X-Received: by 2002:a05:6122:894:b0:5ea:f220:fd6e with SMTP id
 71dfb90a1353d-5ec4cc889famr57865e0c.11.1793127914185; 
 Tue, 27 Oct 2026 12:05:14 -0700 (PDT)
Received: from [192.168.69.229] (82-67-153-177.subs.proxad.net.
 [82.67.153.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ecd35c2sm23993049f8f.39.2026.10.27.12.05.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 12:05:13 -0700 (PDT)
Message-ID: <1b1f25e9-89e0-422a-b72b-bfd79c3c1bac@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 20:05:12 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] rust/hw/char: add QUP GENI UART device model
Content-Language: en-US
To: Brian Cain <brian.cain@oss.qualcomm.com>, qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-rust@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
References: <20261027183823.383806-1-brian.cain@oss.qualcomm.com>
 <20261027183823.383806-4-brian.cain@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261027183823.383806-4-brian.cain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae0f5eb cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=9LxoPiivgX8PBtvbXuYA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: DKuqXuaW7ynWJ-c8VNh5ThX1G_ZBqCGN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3NiBTYWx0ZWRfX9ZAlRKHmEpCM
 2tVHXqhiYnQLm9kS8IRCJpEoi4MndFKIaYsevMKRzGfKMouZoluRVQGeW2Q4ab2EoUmJXQjcQvo
 ZyBwZoYV2Jf7jhlYnQgy6Y84wifNbRQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3NiBTYWx0ZWRfX0tcBDyENouHo
 5kxmFoM9BLipGQEcxNMuWgqVIxiSWxIQ4uoxk7Mz0eeh9+HAzIj7qJIDu9QJ0l8dU2YacAxOPMp
 jG7jKNlX+z1iFGm4QrRFk9FtuWqbaCQDZgoxodSc0lcYG5yjXWZeTLmsEvJ2QEkFdLDIKHPFYIi
 sX/ZHOEx9pXaWYKZUMHARiczl1i8yAnc8I3udrX1iexmOCOaZTjiDkKO/0qc4DczQm3OWO9bv1B
 UAAi/FUTkcgSXYDnFZA7Lyb1wd2eNQ+HotmncizROsLo7pQhJshw3NjaNQ5Lk67U4Qgxk6KW/m9
 sgL/KE0xG2S5ScsmoBeX6qS1AEOTz0L8fu54DAP2OjHPSB+lLp3cBFnT/Cs0vwpsQgecZ+KiRIp
 ZzcQdPtVChL56mEz7kIeWLdLeMUjHKILc98OjRxJzq6zQSxBd9IiDEQ0B130YgIF2g1Tm03gFBM
 wAkaMnNV7YdAVxZZUWQ==
X-Proofpoint-GUID: DKuqXuaW7ynWJ-c8VNh5ThX1G_ZBqCGN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270076
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
> Add a model of the QUP GENI serial engine in UART mode.
> 
> Supports FIFO, DMA, loopback modes - DMA via memory link.
> 
> Signed-off-by: Brian Cain <brian.cain@oss.qualcomm.com>
> ---
>   MAINTAINERS                                 |    1 +
>   docs/system/device-emulation.rst            |    1 +
>   docs/system/devices/qup.rst                 |   10 +
>   Cargo.lock                                  |   15 +
>   Cargo.toml                                  |    1 +
>   rust/hw/char/Kconfig                        |    4 +
>   rust/hw/char/meson.build                    |    1 +
>   rust/hw/char/qup_geni_uart/Cargo.toml       |   27 +
>   rust/hw/char/qup_geni_uart/meson.build      |   28 +
>   rust/hw/char/qup_geni_uart/src/device.rs    | 1293 +++++++++++++++++++

Too big for me to review (not sure if easily splittable), I'll skip.

>   rust/hw/char/qup_geni_uart/src/lib.rs       |    9 +
>   rust/hw/char/qup_geni_uart/src/registers.rs |  160 +++
>   12 files changed, 1550 insertions(+)
>   create mode 100644 docs/system/devices/qup.rst
>   create mode 100644 rust/hw/char/qup_geni_uart/Cargo.toml
>   create mode 100644 rust/hw/char/qup_geni_uart/meson.build
>   create mode 100644 rust/hw/char/qup_geni_uart/src/device.rs
>   create mode 100644 rust/hw/char/qup_geni_uart/src/lib.rs
>   create mode 100644 rust/hw/char/qup_geni_uart/src/registers.rs


