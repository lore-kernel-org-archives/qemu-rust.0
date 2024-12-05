Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tJGQr-0003m6-3w
	for mharc-qemu-rust@gnu.org; Thu, 05 Dec 2024 13:18:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tJGQo-0003lh-JW
 for qemu-rust@nongnu.org; Thu, 05 Dec 2024 13:18:30 -0500
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tJGQm-0003aE-AN
 for qemu-rust@nongnu.org; Thu, 05 Dec 2024 13:18:30 -0500
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-29e2a50586dso835463fac.0
 for <qemu-rust@nongnu.org>; Thu, 05 Dec 2024 10:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733422707; x=1734027507; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OvW+AoLKv7khBYjogVRnXYPZ9+tLmE67smJq3+Ckyxw=;
 b=QPln7iUGCaTPpe7N/+MzURrGLp1sArE4eZGdFf+Fy0ilYACXTmHM5ft+vIkCxYAvKG
 0bN+VuAJZjPrzdBSJ5CEef5iH0YGIyEUwxtH/FiaRl2vF1B3hLqACUlRR4+j5iWWhMh1
 LZwYyQCfJERmkwUOelZt8NLYioGkT4X3Lj6ilKxDugK2ml5gOzTwuNCNUP0j8ljkBi6k
 ukgSsB8UgunsVbYsjTr5URofGZvsiUR3NnTweZq8o4DcP17vxIUuKnADmqmfcPKuhUtC
 +w5hUH5f3cNc098hnlVzFw37fvK9becSVSnAy3nMRDH+PLHG9gm44yr3E83G7dyqlzR1
 ObTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733422707; x=1734027507;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OvW+AoLKv7khBYjogVRnXYPZ9+tLmE67smJq3+Ckyxw=;
 b=XxwuCqk1W4cZ39lDP2ZumSNy+y/HV8SaFqmj3wLjlc3O2IN54HtOoZCaKz18VU62cg
 4Cy6OWOYeV4EfoQMtRc3dmgT/h+3Fo3yNZLcSQoi/Iqsu06ZOaHdmBlDYgGsdJcSl60y
 v3XekSUTxSrylqPWx0QN6YrjJo0vaOK7eUUe//g5UkSrKb2J2TzCGS5Ecl2taGpP8eMk
 0K21UzYompen7z14RR0LLi9X6GMlKreJYoMnVaAnjFG/5UYdamUxzInJzQYGmalJggqv
 tAKocQSefP75JDrHt5t22T7fX7qd01WZoryGViywFUCBqnDTGgS2h1jNFKdusQgzOc3Q
 tJAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzpx9PWO/BnUyw8mJ5dpOO7ZB8PrdO+DzTWM18+stJLS/2sWFNC2Hwl6arCzPfSwftMnYfCIs1n2s=@nongnu.org
X-Gm-Message-State: AOJu0Yx5LK+/YmSG87I3mVkp4Mwf3SKd+f4L6BE4aC1ah+wCAKDYvnnR
 41jdZaVPFfXVfFQ94ta8U8yeuB2jMbuwdfs3MJCU7YE4dnZQRCaUE7WE9L59k4w=
X-Gm-Gg: ASbGncs/hGWDlgXFyqjmRAPUjGCflLYu8VdmflWY+89nk63EFind1cgIvz8lmda1OFM
 a47kdOovRgbSKS/rxdHTV4vDlMhBhnvzWFx9XmjUsPat55hmhGlNK3lAgtzS/dzY/u0xUnXBwTL
 74GZ7Yfm1W6DPsUdQMVOI8bFP7DLWS94JpBgBJRC6DTTahdpzeBY1zttiVVdnVmFdMKySIoxiA4
 h2NHm747L9Py37vf+UhkI52k0I3xNY2gfaHyvPAxW9mVO8XRgWXPPwRSIzCGFxCFA2z1iVcD8kO
 LueMxdY233kugTpiI3AccStYg3mi
X-Google-Smtp-Source: AGHT+IH6hz6vVkAApltL6NLxWhz4VChjsDF15qLCj4QcuhLmWYDlnnHc+SLTuk592+nw+jE+rSzZ4w==
X-Received: by 2002:a05:6808:1482:b0:3e6:5792:2fb1 with SMTP id
 5614622812f47-3eae4f2f567mr13867097b6e.10.1733422706758; 
 Thu, 05 Dec 2024 10:18:26 -0800 (PST)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-3eb077f4235sm398319b6e.34.2024.12.05.10.18.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2024 10:18:26 -0800 (PST)
Message-ID: <cc6cc13d-ec95-45d2-8722-e12f3b82ff92@linaro.org>
Date: Thu, 5 Dec 2024 12:18:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 07/13] rust: add bindings for timer
To: Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Junjie Mao <junjie.mao@hotmail.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
References: <20241205060714.256270-1-zhao1.liu@intel.com>
 <20241205060714.256270-8-zhao1.liu@intel.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241205060714.256270-8-zhao1.liu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x32.google.com
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
X-List-Received-Date: Thu, 05 Dec 2024 18:18:30 -0000

On 12/5/24 00:07, Zhao Liu wrote:
> The bindgen supports `static inline` function binding since v0.64.0 as
> an experimental feature (`--wrap-static-fns`), and stabilizes it after
> v0.70.0.
> 
> But the oldest version of bindgen supported by QEMU is v0.60.1, so
> there's no way to generate the bindings for timer_new() and its variants
> which are `static inline` (in include/qemu/timer.h).
> 
> Manually implement bindings to help create new timers in Rust.
> Additionally, wrap timer_mod(), timer_del() and
> qemu_clock_get_virtual_ns() as safe functions to make timer interfaces
> more Rust-idiomatic.
> 
> In addition, for timer_new() and its variants, to convert the idiomatic
> Rust callback into a C-style callback QEMUTimerCB, introduce a trait
> QEMUTimerImpl. For any object needs to initialize a new timer, it needs
> to implement QEMUTimerImpl trait and define a handler.

It might be cleaner to move all of those static inline into timer.c.
I don't see anything performance sensitive there...


r~

