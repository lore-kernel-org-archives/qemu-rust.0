Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A2D606A31E
	for <qemu-rust@archiver.kernel.org>; Tue, 24 Nov 2026 10:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HJA+ANLi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R1AvBnDp
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1xVnU3-0000Cz-Ls; Tue, 24 Nov 2026 05:10:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xVnU2-0000CF-8A
 for qemu-rust@nongnu.org; Tue, 24 Nov 2026 05:10:42 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xVnTv-0003g6-Pa
 for qemu-rust@nongnu.org; Tue, 24 Nov 2026 05:10:41 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AO8owmu196970
 for <qemu-rust@nongnu.org>; Tue, 24 Nov 2026 10:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hkU8X3tHOGWlAcedfuWRYJ/hstIcvgCRRyGQkHGo/wQ=; b=HJA+ANLiJYpemiiw
 8Wv+UaynXZkikl1+xB/latNwYggicheM9ORTVii6nqDjm9LDWu/8uvv6AZVAPWZ9
 tc4JPiaZ1RsaaD6sM3VSAbV+WT+Kut4hsOGsdIbWR1lV1jrV4PS+9Krylh0OslKW
 kHsBgnTwii0GLVTOEulf9YpPbmcQSX/tLiOpcV/TsNXS55+NoZY9xDeNNJ8f5NQC
 Ik4++LZfdSAwl2xPGHstqEyMi8yVBt5kgPPTcBZnDxeken73veE2RDandThjQc7n
 vD4vwv4Wd4zIAklOmQ1Q8rZh8gawKf0isyxH0mjONsU8zQLk834+ywIKCypH2Uaf
 ngDvkg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukrb42a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-rust@nongnu.org>; Tue, 24 Nov 2026 10:10:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-949dc497896so247584985a.0
 for <qemu-rust@nongnu.org>; Tue, 24 Nov 2026 02:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795515032; x=1796119832; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=hkU8X3tHOGWlAcedfuWRYJ/hstIcvgCRRyGQkHGo/wQ=;
 b=R1AvBnDpHu5D2LP7pfS3DGau9Q+DIzjTzCvOVMGLbwetCv+AmfvYuzV6wQJ9paDWM4
 aWb4gfQMLJMqhqft7LUDIcioLOqcGbvHA0R/7XgZHcZQurxLHFTAsLj4v2fZkblaUoSV
 yqXxzawr6ThNQXZyFRxuLJIglDjduGCilL0U9EWOI8F/G81mEm0vWrfsRzV/jg+dLK2L
 fD6cM/7idB0VY3SUw6+IoS5mDyE5FGfWfzxaUALu6hjLnWudc9lzT7jaLXAkAzfxWDm2
 0C5Xq7I16uLEFdaTbctj4PfREwgTD1tyhV7ZzP08wSVdhLzZ6iJbKVz232FF2ZQhBriy
 qNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795515032; x=1796119832;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hkU8X3tHOGWlAcedfuWRYJ/hstIcvgCRRyGQkHGo/wQ=;
 b=rlXcbb796N1PwdH2Kflcz2WiSic67y3Zhcd5r48C1jUvMcBA7522QQs/poBdYrP1Fr
 LoZRZjleCSLD9xmBT7OY4QxPrfa6RMtPctsqVOfLYnI99x2yVMHrp9YGWBuV8EkH15f9
 8w2+u2VxxJZKm47mTkqmAei6cECtMcNJB7oCPvW2R7A+yhzTa2LxmTvNZwIEfC5aBwLG
 qF5FsAsZO6rhJfRneufqX4gIv/ax9Z86Bv3uYkGDd8ht30DAS+iPb2FnfNC6Ya4AkShW
 ymCpXHWLs+vMyO+HJD0T84CiywkApSlz3Py+wV3huERnhBBgrXwyaMmX7i2NkRLNOOeG
 GOfw==
X-Forwarded-Encrypted: i=1;
 AL+hErEMbdvahoda/nBqycSNE0ghqnUZYLVyCs1kIEuksIj2ndJfQBt5Vrn2dAAVBOck191p59VDmm2nIXI=@nongnu.org
X-Gm-Message-State: APuU4Z8hIxLU0VBw8ibzqUvNTUyyI4fZZfA/qTcznIZBQagj4LR+T97t
 AIlJ2+XqYcfVxSglyvwGpAd48uyYbgBa1AUTYiutVyXpQFef35j9moT7DwCQQi8xKdFehfnHMlU
 E56lEz/pkTDUrfXuLe9KeVOq1Gk4di/Ad2E2o9bA8X3rQnFUBAVYhkXG6eD3mG4CLrF4=
X-Gm-Gg: AZFdTZfPKS1nHAQzLwzcfHKfGI5S9Sm6K5giQLouIS4k9O668NtYZdwzbuydgVKALgq
 ecnQI0CL+Z03xO3OtiB4N0pgmMAgWbjbte6aWtS1uNlTiFSA710unfJB5n/9Sx2pjTwgp06jQlU
 SN7N/Yks/r4JgO7maa/IP6iALbN/n0vyTY62A3WY2IhqotfCXAH5irhjMKumVGlGTtPuA4vLBSs
 XSGmIKk7toz26Jt3ennTFilo16YlY9g/u8UlKG0jU91os8pJBUW7a7ktdnEKHP3ZsYFsLgY7JZd
 Au2N2VwKj4l1RFQIa0IJigrZKxmUG1F5eop/yfPcThhq92TSOMdXnMsl89NirdpezgiuyQb8Y1d
 fF+Lk1GtzhPKLfCR2+GaPh6MDg0zc5vfCk85H64OK5Z9uZ19t7P5kkR7irlEeiczjKiH43SmyfH
 09DjA9ZSA=
X-Received: by 2002:a05:620a:450e:b0:949:8901:dc67 with SMTP id
 af79cd13be357-949ba9b8cb7mr2519317085a.29.1795515032523; 
 Tue, 24 Nov 2026 02:10:32 -0800 (PST)
X-Received: by 2002:a05:620a:450e:b0:949:8901:dc67 with SMTP id
 af79cd13be357-949ba9b8cb7mr2519313585a.29.1795515032048; 
 Tue, 24 Nov 2026 02:10:32 -0800 (PST)
Received: from [192.168.69.234] (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab69bf680fsm30886311f8f.14.2026.11.24.02.10.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2026 02:10:31 -0800 (PST)
Message-ID: <ae1dc71f-ca73-4175-af3b-767c0adedc79@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 11:10:30 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] rust/hpet: Move vmstate_validate!() check into
 post_load
Content-Language: en-US
To: Zhao Liu <zhao1.liu@intel.com>, Peter Xu <peterx@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
References: <20261124095814.437738-1-zhao1.liu@intel.com>
 <20261124095814.437738-3-zhao1.liu@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261124095814.437738-3-zhao1.liu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzOSBTYWx0ZWRfX959fHzs4zOJ6
 81m2lz4VKL14KjmGSlDc9hTrzT8M2PFs2AyOqspSlMxH+0r/KzEvRZz557rTTz55U2r11mKnExq
 Fo1VKeFudblcX+uTyjVi6fGvV8s/G9U=
X-Proofpoint-ORIG-GUID: MDyKN4If5gGPtI1bBL3mAjqAWauL6uJ7
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b056299 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=20KFwNOVAAAA:8 a=QyXUC8HyAAAA:8 a=rvb3tsV_-39S2AzPs34A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzOSBTYWx0ZWRfXw5/xNOx5CW7F
 5K6s8IJcMTwMTejEkd0wZuJHLrsZ+WhsRrN1WnvR+xwd8yTfkBucp4TDfWIQZtE6k4C4wuICeVB
 YuBWDLmJ5dJ8EsqXQjOp2uUM5aZyiGw3Aqd8zhfGAAypGw/IWdwJOHcQOghswl1ZwWWi9xgKyhy
 fYVe1hZTmgHuqep5NH/ISswmYd6pfyQDVJtNuVpBy3uWQTQDcWFELexR0Z9ink88yOKqAhKC4Jm
 /rMWaP873Ctm6YpxSMONaQJcreF0KEDGS0JGSIjbs3zGRAUTYmBx6KapB2V0DNFBhqAKnKeFGNH
 hy6pmsaTO3Ix3BMKwY46dH8rURAoxK3nqCVpvws+bLbDFrOsi2D6bLpCC/PrphIfTrtRaNAOqAM
 V5+tSMhDtlJVmNVNKpSITCuOsNsv7GGd8fO1P+UyBwbceID3AGdl/RzFnv8YFdYE2itWsUr1B7f
 3gChwC+fIQVDCYJcsUA==
X-Proofpoint-GUID: MDyKN4If5gGPtI1bBL3mAjqAWauL6uJ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1011 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240039
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 24/11/26 10:58, Zhao Liu wrote:
> To pave way for removing VMSTATE_VALIDATE() (and vmstate_validate!()),
> move the usage of hpet into post_load. To make it safer, loading the
> timers with the num_timers, then only check against the wire number at
> last.
> 
> In addition, drop the test_fn() in the VMStateField of HPETState.timers
> - this was duplicated, but now the check in post_load is enough
> (and test_fn should not be used for validation).
> 
> Originally-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
> Copy Peter's commit message from his C HPET patch because now this patch
> has the (almost) same logic.
> ---
>   rust/hw/timer/hpet/src/device.rs | 45 ++++++++++++++++----------------
>   1 file changed, 23 insertions(+), 22 deletions(-)


> -const VMSTATE_HPET: VMStateDescription<HPETState> =
> -    VMStateDescriptionBuilder::<HPETState>::new()
> -        .name(c"hpet")
> -        .version_id(2)
> -        .minimum_version_id(2)
> -        .pre_save(&HPETState::pre_save)
> -        .post_load(&HPETState::post_load)
> -        .fields(vmstate_fields! {
> -            vmstate_of!(HPETState, regs),
> -            vmstate_of!(HPETState, num_timers_save),
> -            vmstate_validate!(HPETState, VALIDATE_TIMERS_NAME, HPETState::validate_num_timers),
> -            vmstate_of!(HPETState, timers[0 .. num_timers_save], HPETState::validate_num_timers).with_version_id(0),
> -        })
> -        .subsections(vmstate_subsections!(
> -            VMSTATE_HPET_RTC_IRQ_LEVEL,
> -            VMSTATE_HPET_OFFSET,
> -        ))
> -        .build();
> +const VMSTATE_HPET: VMStateDescription<HPETState> = VMStateDescriptionBuilder::<HPETState>::new()
> +    .name(c"hpet")
> +    .version_id(2)
> +    .minimum_version_id(2)
> +    .pre_save(&HPETState::pre_save)
> +    .post_load(&HPETState::post_load)
> +    .fields(vmstate_fields! {
> +        vmstate_of!(HPETState, regs),
> +        vmstate_of!(HPETState, num_timers_save),
> +        vmstate_of!(HPETState, timers[0 .. num_timers]).with_version_id(0),
> +    })
> +    .subsections(vmstate_subsections!(
> +        VMSTATE_HPET_RTC_IRQ_LEVEL,
> +        VMSTATE_HPET_OFFSET,
> +    ))
> +    .build();

Doing the indentation change in a preliminary patch would ease review.

