Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5B4E9A03B
	for <qemu-rust@archiver.kernel.org>; Thu, 19 Feb 2026 03:39:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vsusl-0005du-E8; Wed, 18 Feb 2026 22:39:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vsuse-0005co-CA
 for qemu-rust@nongnu.org; Wed, 18 Feb 2026 22:39:08 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vsusb-00027g-QP
 for qemu-rust@nongnu.org; Wed, 18 Feb 2026 22:39:07 -0500
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-c7059b9df33so252112a12.0
 for <qemu-rust@nongnu.org>; Wed, 18 Feb 2026 19:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771472344; x=1772077144; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2kMJJp1Ay+vZ6BV9uMuIB+sg9ZroJe3b/ivrbyxfHXg=;
 b=lCN15oDA00Qdf0HxoxOTY8u62nEJKNFgs54jLhkNPS6ijAty2C5A9Y+BsCjmNXjDZ7
 FbT0mwBbXa3c18paMLevhoff9qgR/canr0uVtLbWBddDjj839jpcds3h+4jEBK1/HBMV
 X5JB18gzzqk2aWJ4+X8LsR5E8eEpl8Pb/Wps3vC4XRUe99ydHW/bdRXDzZoS/sWSnTf5
 OD/+HwpynYF3lH8mCI2y4Wq1wbNA9inrz4gzsx9m/rEJ56ririhPdForUFf/64PwNwsU
 ReKv6wToJ0zUgKD8PkCdGTslLJNlALiEfosiuy5wLOZcjSJWNj3cUG2Eo+KetN0hWzZ+
 jOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771472344; x=1772077144;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2kMJJp1Ay+vZ6BV9uMuIB+sg9ZroJe3b/ivrbyxfHXg=;
 b=ubW0rDfGtKT5sPYlX+m5gukFcjVMIgWi2tpBi/HoCBEfC/iXVTyCbnKox2YGlmScyD
 s5cy9HU6dnBdZnehqv+IMQ2Mcyp/BMcwXSIxuUoyhHmxTyF26tH5kcBvhNz64Xrr1cMS
 LWq7jYhvkvs/jKBXNlQalSlSAtoOdu0VWbA7OCCKs+MD9arbzMRPr5FXPPYnQ3zKvsBw
 BXvLZ69y0hQwbtdTL3Sv092pu2zuCwejnmbKB57M+WeqjuBS2GCi8q7aCTs0A0v6Ba/m
 KpubXBaF9aWVIiUhGJ+N9CQqhkxAGVbqFceKYNuzvPM3PoHRfAyk6NSQuZDIR0Ym5hVM
 t6JA==
X-Gm-Message-State: AOJu0YymnRSbSGXlQGeYPphYWzOI8J3mjsw+l5ISQ/yCA/DZc2CZQoWG
 /mmAZqV3RZUc1H1IKDxXjLrgf6s37GwKm2/pcANYw6oo5ZSX8jjqLg/jWHkcDQXrIyY=
X-Gm-Gg: AZuq6aLbhndMA5papkrf4+sgo2iYHlYEGdnyFcmbrAtOrAYSYLIMgX+GI+bMqpBjpPl
 lrmfE+dxv8sOCnNk3+XdlZXmpqWaDeDLYEmKiikS1t7ND5jK6Ek8ZcehhWeQst8sBgNtgZnyruJ
 bIDlTxCT9VabiyiOqAdHexjEG+mSSrzdZLx/JLjQP0yicGzFq5LZBbAfF4a0Qp8ACrEhfi2m9hy
 GxSrZIOV0b11FcwAUPGtCU+QpL+YNTjvmqiIOPjXFFPfqeRWhCLzZaHYNcw0dilQHngECk8v6kB
 9ys03bm53HG5Pmi3p0feRctWveUJCAZkJYG1bI25E2/JczYWDhXHUyQARB5TTHRVz3hV3IQrFQb
 D3nsk1bzGMIEV/Q5ceP0Qm74SFj/J88eE3cpSLeC0nHR1RofqwLJit3CX0SUYUamDcgFvYJQPXt
 eY8ABcRbLh3p98v3j81FHYH054bli+uVRrHJnQW00X4BgwP1kOnOOSyOFvo4UxQFU/QxfVu6ifC
 6rm4JHjNBWDJHFkrirzOGdFsLj2D+/GmALYmeii7cH9qASEKUS3MqIpnJpnrI4bUKUU
X-Received: by 2002:a05:6a21:489:b0:38d:ec17:180 with SMTP id
 adf61e73a8af0-39517c6e7fbmr508415637.5.1771472344159; 
 Wed, 18 Feb 2026 19:39:04 -0800 (PST)
Received: from ?IPV6:2403:580b:742d:0:a224:e0c2:669c:b307?
 (2403-580b-742d-0-a224-e0c2-669c-b307.ip6.aussiebb.net.
 [2403:580b:742d:0:a224:e0c2:669c:b307])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c6e52fe2e75sm13803232a12.10.2026.02.18.19.39.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Feb 2026 19:39:03 -0800 (PST)
Message-ID: <118306d2-8c7f-4b8d-bba7-bf4529c3cc9b@linaro.org>
Date: Thu, 19 Feb 2026 13:38:57 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] rust: use checked_div to make clippy happy
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20260218192444.658046-1-jsnow@redhat.com>
 <20260218192444.658046-2-jsnow@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260218192444.658046-2-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

On 2/19/26 05:24, John Snow wrote:
> When upgrading from Fedora 41 to Fedora 43 for CI tests, clippy begins
> complaining about not using checked_div instead of manually checking
> divisors. Make clippy happy and use checked_div() instead.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   rust/hw/core/src/qdev.rs | 14 ++++++--------
>   1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/rust/hw/core/src/qdev.rs b/rust/hw/core/src/qdev.rs
> index 145e20a984f..c4a7312168f 100644
> --- a/rust/hw/core/src/qdev.rs
> +++ b/rust/hw/core/src/qdev.rs
> @@ -425,18 +425,16 @@ pub const fn period_from_ns(ns: u64) -> u64 {
>       }
>   
>       pub const fn period_from_hz(hz: u64) -> u64 {
> -        if hz == 0 {
> -            0
> -        } else {
> -            Self::PERIOD_1SEC / hz
> +        match Self::PERIOD_1SEC.checked_div(hz) {
> +            Some(value) => value,
> +            None => 0,
>           }
>       }
>   
>       pub const fn period_to_hz(period: u64) -> u64 {
> -        if period == 0 {
> -            0
> -        } else {
> -            Self::PERIOD_1SEC / period
> +        match period.checked_div(Self::PERIOD_1SEC) {
> +            Some(value) => value,
> +            None => 0,
>           }
>       }
>   

These conversions are inconsistent about the placement of divisor and dividend.

r~

