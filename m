Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0F6CAC5A5
	for <qemu-rust@archiver.kernel.org>; Wed, 24 Sep 2025 12:23:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v1OVw-0000gN-0V; Wed, 24 Sep 2025 08:22:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1OVi-0000eR-T8
 for qemu-rust@nongnu.org; Wed, 24 Sep 2025 08:22:22 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1OVW-0000Ad-6O
 for qemu-rust@nongnu.org; Wed, 24 Sep 2025 08:22:13 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3f0134ccc0cso5150202f8f.1
 for <qemu-rust@nongnu.org>; Wed, 24 Sep 2025 05:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758716513; x=1759321313; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y0znOe9X4B/PKbemoxCtXVM5awE/1hV+1r7TY6n0OQU=;
 b=uuixDhHCedmSs/DSrAM6KHIggj12Tl+fVk4CX8Q8kd30Wubx5+LCuJR+1kWUoNIOlB
 /l4cQ86jCgdRn0aDOf6x0AXatwFf8CNO0JGLWDc7yWAHwS1D9MyGe9eDxX4V6w8UqbCB
 EVZAMU29qJOjjthj79l7/ZWkfV1kBmPsFhU+yaB1qEzHfd2/RMGFryMB9UteR6xBJvO6
 IyHBbJ6qghnY4ZLuF8n/3Sh6EDBHECnC3mNLn3risXbqvexF0vdnzsUOYyFDfjlfUgGJ
 HXGgvkKw1CGC6tpJL1GxTwYbHJofkUZGhpqLGH1y0aL9gqTNpiFZ429Dkw7rVogXOt5J
 51OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758716513; x=1759321313;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y0znOe9X4B/PKbemoxCtXVM5awE/1hV+1r7TY6n0OQU=;
 b=gt1PUx3SE34y4M8dHkI24+7+Bf3fqybYPtI25PQg4b6MF9OVBqHLVHnAWbgZ5h7m21
 WStsoMec2BgmoDtgQ4OiIgMD6dMXHZqTGxCbokho5pENYi/sEYLhVThqZxuos5h/MFQy
 oqSphRzmTYFKV3uiL5SVu03U8/QO/rjZsj0OPyZyT8pS3qMPc20gVACrpaYRP6iPkOcf
 2qV22IYtmF20mY2PJZmRumZWrL66czqpHJ5bZ4prhdHVZFYP1kBXILE/v0VEqIa4zhkv
 zdtFCb/cYm4xtt9GKlPITUz4eTWyDrOpBL9+jaFPr09bT4S57EjYhlzNAyASD5Agw1p+
 HyFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUn85yOAXOg4hF4ceiTIB3cjY68AfRVOV8UrAoKxRX1Am2NK2RcMeIBzakR7Qs1J7Byv5HMVpKqZzc=@nongnu.org
X-Gm-Message-State: AOJu0YyzOJ5EpzfoN0Hnk9jaBFtfFbH4VJezd7kOjmWcXT6fOS5197HQ
 IhcWH8+zbVYOT3f3jppGIFpP4r9lDjjx9epwSVbzp7i7j82jdegnrvExSIPBTGIrS2k=
X-Gm-Gg: ASbGncuW6nDxfiepKKwsIDERBIII6ZBGLuZr7EsfWtwmkPH4Wsx3ETLGxNt94EGQ+HC
 3C8EmPIYK/o6j+i8Z/ZGe20+hGYvphDa+LZlGG3dx+Gko2UH8egx5bP00nWh/Q3Op7eN1r5lpXs
 d1tECDUtNFsEYd+dEN1AnYL0OoR9HK2ePlmrpdgMo1ooQrAVYk32dq/znDsldxWbUC9ZfYyl3Tk
 YC4Ij2TWbpHzu9lxzQAZLY3Yfy2nWSCqxUNjPNTzHug8Yt9oT3tUQF+U5D2MKdhSLcdwfe/M29k
 fjJr/LWnxBKoDXfwoVftdM1eeUvscpGgJYhG6E8nr3hiffMavwAPZuis34T3SV0vBufxklEsaLt
 Ewoq2l+lrz4tHdd628MkFL2TKOcn3EEIIchnA/RypjlrFnfmh5Q6rJ4b7KY2F+eRtpA==
X-Google-Smtp-Source: AGHT+IGxcqd8y70UKTOIYQrCqi2wMjfCHzVYmH3qBBwLsAfmtpkEioQL6ghzMao5t5IEoZPUKrVIGA==
X-Received: by 2002:a05:6000:2902:b0:3eb:d906:e553 with SMTP id
 ffacd0b85a97d-405cb9a546amr4874083f8f.55.1758716513297; 
 Wed, 24 Sep 2025 05:21:53 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3f02f332c31sm21975989f8f.45.2025.09.24.05.21.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Sep 2025 05:21:52 -0700 (PDT)
Message-ID: <79dcaa8e-450d-468c-8df3-508eec009f07@linaro.org>
Date: Wed, 24 Sep 2025 14:21:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 25/27] RFC: build-sys: deprecate mips host
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ed Maste <emaste@freebsd.org>,
 devel@lists.libvirt.org, qemu-rust@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kohei Tokunaga <ktokunaga.mail@gmail.com>
References: <20250924120426.2158655-1-marcandre.lureau@redhat.com>
 <20250924120426.2158655-26-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250924120426.2158655-26-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 24/9/25 14:04, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   docs/about/build-platforms.rst | 2 --
>   docs/about/deprecated.rst      | 9 +++------
>   meson.build                    | 8 ++++++++
>   3 files changed, 11 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


