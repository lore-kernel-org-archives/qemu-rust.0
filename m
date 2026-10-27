Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE5B606A31A
	for <qemu-rust@archiver.kernel.org>; Tue, 27 Oct 2026 20:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UP/nvKs0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T9OV2pqY
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1xLnWx-0003WG-NT; Tue, 27 Oct 2026 16:12:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xLnWn-0003Tl-9n
 for qemu-rust@nongnu.org; Tue, 27 Oct 2026 16:12:16 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xLnWk-000716-8I
 for qemu-rust@nongnu.org; Tue, 27 Oct 2026 16:12:13 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69RIHEhB2087937
 for <qemu-rust@nongnu.org>; Tue, 27 Oct 2026 20:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1DP+UDgo8wUF2xqwY4mEXXO9v9j2YvY2NTVnMh+oQ/E=; b=UP/nvKs0LEnVf5/X
 W8O+xp3C6DX5f6ZKi/D63K3t9bYocffU2ZlumszlZhqYPbyQWmlRwsmfh/Xyns3M
 YaksIhCbr84dmzqI6dMkSpFUJ3jpaFy24bpOrpXjusgzKMoK4Mdta3HJEO1kguFY
 GVKq9ajUaqroKFSW+L485SKZEzxe1QV/jCGiJjeYuQZyDUPfazP/yrSfZULDzkep
 TrAdOuy0gh9ijQsTLZd98y0VeJIL6CaO/1sc518fmNltrNMQ3rkHKUY0UuC6VmWS
 PLnfyA8K7wFZ50St/a5Mioj8YNp6qc7NqsM+TYiigRfjN5PJmuAT6kEPTKEejXvF
 U7ngJA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjp2tbfuc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-rust@nongnu.org>; Tue, 27 Oct 2026 20:12:08 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-3425098ae4bso1583554eec.0
 for <qemu-rust@nongnu.org>; Tue, 27 Oct 2026 13:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793131927; x=1793736727; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=1DP+UDgo8wUF2xqwY4mEXXO9v9j2YvY2NTVnMh+oQ/E=;
 b=T9OV2pqYYntNuYPASt21EbMaTBu3PW3V9EDw2V3qQjpPW+waIBuGON3WLr5xqJNkjw
 8W4OdK//GbpF6JNg8NDUDNV1Wap5qjRQmTdzF/0nOjvxUGkQz2OhznATpphQsrUaqb7l
 I3WtGxs+NZYXqJ5sgKRsMmATRSygzvqfXDBizkCLhSEPihZ7sbtgJkVZ/zT7utEf5SdY
 1DTpfEjjgZ+0KyUzSLUWVWerYMYAy3uHCTqsxq4wCcClLwGkCy28yQIy4Hs71R0luFyM
 qwJ/amySYEOWpIwx1TH2n6NSIs3vOmBhoosyKssgBeAtfIjrm/mdnMuf/wp4QOnweGd/
 nV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793131927; x=1793736727;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1DP+UDgo8wUF2xqwY4mEXXO9v9j2YvY2NTVnMh+oQ/E=;
 b=NTce89jeVqHwpVINQ4aCjduPRwPEmh9O9Bg2Dim6hw+70vl8Iig6bqlfqwyXLvJNE2
 Y1ti2xsxVHrk76Ekk0QjYciMh9HUN0gpzFbw1sdkTXAgpV8wcsfy4GKvoKHsFWLiM3/J
 hsPqSeVs+q8us5m0IoA8VNpJlRRALaIKaJbfB0wucStKkJvo1QVEg4L4e1xyVwdvVuEG
 5hTjY92stz8JJ0gx5Xa6BnXYJg14L7jugvpAVvhH4QxPC0GxP5jKC+ZGiH+cWCueWRt8
 3KgqZcj54ml0x++ioC0Fb6s35OSu5OHMLgsrqoK/hv+WYLY50/9mNdwmWs3HxccHTbX4
 3gCg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwtwdCzsUGfqzJAQ7Ka+WWN86FAh68hK69DVwgF76Voc1KOx2QwKZtl2SP15rufWZQEZnB6MgMTgk8=@nongnu.org
X-Gm-Message-State: AFq9FYK5QBY7bQgnmspF+afyroInX5S57CgnyhxTy/74538Jh2hgUoZ0
 xtj147Ut4QCTHb3s7QAL36RImxY0P3JlcytDD1t0BmhYO1qUpa3wMHV1dEdbjzo6v3uPlgzO2/d
 +Zjfiada5dHvC0pMv1kzo7ywHkRyYIS7U13lZR6rLCbmRlz3fQpsRcZs4
X-Gm-Gg: AYBFou3SyijLej4NixfQxbDxoM4ljJ4NqfqroP+4L0+CCXI/110cY7vTkxHxMlTLEFI
 KzSZxdINOI8niEWjoRCBXJZ+OZM0iIoswMjxafJFN7iFv65UBRG8xiPstWWApgocWMeQcuhr7dM
 9uRU1qCPL4vQkuZMFYrbDG/4y9k+QKuzI3/mUplzrzxY6t8csqQS8OVbs89k3ZDB3VrfOBjJ8Wa
 3Qb8v+9w8soBpKBZ2VQkq/KPPQW5Zolea47+ywTUBInP3Td0tSSHqTOqKTzAhiLlByiIbvqlLUo
 iiHk071dC0zXEoQmjKNMWaOsmmFowTadPZu3NNVs1FW57pZeXEBtc1P/7/fFZKHxIAzBDfuPQS9
 YBcQSHet4V1rjeS53JlsCHsVeB58hWzfHTtp6HqJJr2r35lMa4Q/CJcU35wBeUR4LPCVKIDShbP
 qWpcwR8/J10mU0PsXyeMU3KLOUm97mAL78ni6imXyyCac=
X-Received: by 2002:a05:7022:1103:b0:1a3:cbd7:1269 with SMTP id
 a92af1059eb24-1a6cef7a9b0mr263069c88.23.1793131927430; 
 Tue, 27 Oct 2026 13:12:07 -0700 (PDT)
X-Received: by 2002:a05:7022:1103:b0:1a3:cbd7:1269 with SMTP id
 a92af1059eb24-1a6cef7a9b0mr263003c88.23.1793131926161; 
 Tue, 27 Oct 2026 13:12:06 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1a6da44c132sm452255c88.18.2026.10.27.13.12.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 13:12:05 -0700 (PDT)
Message-ID: <59fa861d-a909-4b60-b1a2-c6f6eebc51fc@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:12:04 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] hw/misc: QUP UART device
To: Brian Cain <brian.cain@oss.qualcomm.com>, qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-rust@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20261027183823.383806-1-brian.cain@oss.qualcomm.com>
 <c47cf1a7-15ba-46bb-8579-1b5a2367f2fd@oss.qualcomm.com>
 <916816a7-a1ff-4c5d-805c-6cacad6c95f2@oss.qualcomm.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <916816a7-a1ff-4c5d-805c-6cacad6c95f2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AJjzCM5L c=1 sm=1 tr=0 ts=6ae10598 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jw0jXyRxsvWT7qfrYt0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: FQV2vufxEZxY95NIPxHpcVaUbSpcmSiN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA4MSBTYWx0ZWRfX30G+ZeARUFbR
 znNYkx2y8mgSDEVMjm/k/Ouo1fcTuHPiNJfM9tuBEfzFTvWYwHINfBr5PmT4S21THQjKhdQqfHH
 uvOLDl8vMhfKGGu1opmHcJ/TOx67TOM=
X-Proofpoint-ORIG-GUID: FQV2vufxEZxY95NIPxHpcVaUbSpcmSiN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA4MSBTYWx0ZWRfX6RCZQ6ZUw2wY
 jTpvKWCiecuuEnF1AMnVkCF6IS25LuB8ofwEZOSRYFW0y3sbpbAWFbAot2PZEiTNcZ+nVPC8odV
 Wd6ZS/XkIFi37gVcdx4qGi8Zm4Oy/H3DaY8OPrdTk8m/e3T8mvuhmo8nRD6HGC82EYqTNkzKtLs
 Vua7KE/cKMALy61dO8lM2wcbS0qVg3/iBa6vzFDyI/BLLzUYbrDxLoP46y6VDjorpLI7mJ7BKre
 dYbJGl4apcaYBbPGqG4U+0hf9tvdyjf25KuE0B/KcuhdlDXpuS+tjJC4vIG5CmFrd6xYyLbS/uO
 HSPL/VBM1BSq3vL0pPaRIx7wXIjcbPxCUeH6D+ofpOuIzJKYtmumdDJDLAdyzMxrxYYasr6g+WK
 mrHwqEu2xX5rFXowRFf+Uo03VGusYbQBOacVb/DsZGakqQOHvyin+FAYWNc/Y8Ml+wMX/bPqD4n
 c0YdhDYfDwRlPrIO2vA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270081
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/27/2026 12:02 PM, Brian Cain wrote:
> 
> On 10/27/2026 1:43 PM, Pierrick Bouvier wrote:
>> On 10/27/2026 10:38 AM, Brian Cain wrote:
>>> Add the QUP + GENI uart device models.  The QUP is a "Universal
>>> Peripheral"
>>> present on Qualcomm SoCs, with connections for SPI, UART, I2C, I3C.  For
>>> now we're only interested in UART.
>>>
>>> Will follow up with a v2 including wiring into machines + qtest after
>>> https://lore.kernel.org/qemu-devel/20261027143721.4125584-1-
>>> brian.cain@oss.qualcomm.com/
>>> lands.
>>>
>>> Brian Cain (3):
>>>    hw/misc: add the QUP wrapper device
>>>    rust/chardev: fix write errors and add write watches
>>>    rust/hw/char: add QUP GENI UART device model
>>>
>>>   MAINTAINERS                                 |    3 +
>>>   docs/system/device-emulation.rst            |    1 +
>>>   docs/system/devices/qup.rst                 |   10 +
>>>   include/hw/misc/qup-wrapper.h               |   27 +
>>>   hw/misc/qup-wrapper.c                       |   90 ++
>>>   Cargo.lock                                  |   15 +
>>>   Cargo.toml                                  |    1 +
>>>   hw/misc/Kconfig                             |    3 +
>>>   hw/misc/meson.build                         |    3 +
>>>   rust/chardev/src/chardev.rs                 |   82 +-
>>>   rust/hw/char/Kconfig                        |    4 +
>>>   rust/hw/char/meson.build                    |    1 +
>>>   rust/hw/char/qup_geni_uart/Cargo.toml       |   27 +
>>>   rust/hw/char/qup_geni_uart/meson.build      |   28 +
>>>   rust/hw/char/qup_geni_uart/src/device.rs    | 1293 +++++++++++++++++++
>>>   rust/hw/char/qup_geni_uart/src/lib.rs       |    9 +
>>>   rust/hw/char/qup_geni_uart/src/registers.rs |  160 +++
>>>   17 files changed, 1741 insertions(+), 16 deletions(-)
>>>   create mode 100644 docs/system/devices/qup.rst
>>>   create mode 100644 include/hw/misc/qup-wrapper.h
>>>   create mode 100644 hw/misc/qup-wrapper.c
>>>   create mode 100644 rust/hw/char/qup_geni_uart/Cargo.toml
>>>   create mode 100644 rust/hw/char/qup_geni_uart/meson.build
>>>   create mode 100644 rust/hw/char/qup_geni_uart/src/device.rs
>>>   create mode 100644 rust/hw/char/qup_geni_uart/src/lib.rs
>>>   create mode 100644 rust/hw/char/qup_geni_uart/src/registers.rs
>>>
>> Any specific reason to have this implemented in Rust?
>>
>> Not a bad thing in itself, but it means it's only available with rust
>> builds, which can be a problem if a machine defined in C wants to use it
>> unconditionally. Rust is not (yet) a mandatory dep for QEMU.
> 
> A new device model -> a brand new day -> a new frontier?
> 
> It was an interesting challenge and seemed appropriate given the nice
> reference pl011 device.  But I will concede it can be impractical. 
> Making this device conditionally enabled in the machine that uses it
> felt kinda "lame" and made me long for a day when it *was* a mandatory
> dependency.
> 
> Seeing as how we have a pl011 device in C, maybe it's better to start
> with a C version of the QUP?  If so, that's okay with me.
>

If it's a mandatory device as part of a machine definition, it would
probably be better to stick to C for now.
I hope we can get Rust as a main dep at some point. I'm not sure what is
the criteria to do this change, out of deciding "let's do this".

Regards,
Pierrick

