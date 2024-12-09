Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tKgZ8-0007va-PD
	for mharc-qemu-rust@gnu.org; Mon, 09 Dec 2024 11:24:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tKgZ6-0007vA-0P
 for qemu-rust@nongnu.org; Mon, 09 Dec 2024 11:24:56 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tKgZ3-0002zf-Nc
 for qemu-rust@nongnu.org; Mon, 09 Dec 2024 11:24:54 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-2ee46851b5eso3269864a91.1
 for <qemu-rust@nongnu.org>; Mon, 09 Dec 2024 08:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733761492; x=1734366292; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rQ6HhFBEUg7Y5nMS526uaJ8jSTS3tu04kQ6F32MdhAw=;
 b=EjLrjFQhYU5OL6tBQxmVRQd9iQD0i2/Fcb4C4BJ9T013JR7wIN1h7Kmeqq9mwOwTyD
 bFs0saIxy/sEQzmPIZ0XqQLbLNj5Rxd63yG5Q4wsZMbkzX2uUAIWp/gd3A6Q90jq4Rjx
 EFjfixH0DxYRWij+pV9ZPs+XS9LiFaCmkw8696xzT9jli2m2JaO/XGYr2jRkWhVNq3Xr
 fODbiAQ1DiUsr8Ve88qKZM1UnFkAo/iryWpqHr99Xa48jU7q0XI/nwacs3aQctr/Jkn2
 ujD4P/e/K5c+PdJ8ARd3J6wB40RKKJpmwYwSMj6Vc9rcA51thEwG2msPdM6agP9XoA+T
 YCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733761492; x=1734366292;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rQ6HhFBEUg7Y5nMS526uaJ8jSTS3tu04kQ6F32MdhAw=;
 b=dWhjUy71KnF5ajAztx/SXhUTbYeg3Yf/UVLLjNaQAT6E4tYMAfREkHriHE5SJyvcnN
 1E8tIF85ALTpQdPyq/vt7BtYmBr9ixs3dtQgUlW8sS6CkL5snzylXBm0u1gkDyluNAYb
 N2/h8IGJaogQUXehc0GQntwcCpxZTGfSuocAxYfOJAAARSceYYoUILVwRTSbaOnxxW2E
 P/0ukoE6BPpKKBvGCnvIliWWNRZqm+UwSapnP3Ij/5GuIBJr1JfSME1CyfZV+5PVlWsA
 SHTd+etMpRG9ksqMX0MRA31/jtgDtyqyVGFUB6eke4/DTA2VK2g0SOE/sQKqRd8H+kSd
 8zjw==
X-Gm-Message-State: AOJu0YwLyBWez+UI6QmitXzNbv3NyNJex+EhqEoN85I6SVzrx1J84Pky
 SWP4o2bCZHke2+zhG88+90knEgEvQwJjuqI3jV8tlEnY9j2/2SBBbE85dLmK1vo=
X-Gm-Gg: ASbGncsvjDXm1HlbCtJMDDjm2HLve6dbz2+wPwuVNcxjIpD7ZbUT3emHwLu3xQ9aMmB
 Q27Dvj+8GRXp59HvcCYKNdMD7UCS1dN5Zi7x+5ThgURl271KwQyXd2I8Y0wJLoOTlVyjjxEY9rt
 GM9Maa19hRnuT/MoAMSymllxNN5l0noPaBa92Y/9Jw5tOjenOLvaKbrBtzPwQNpbIgmROKnPx8v
 tzpN0IGttbstpCjEMGjeAtceNNVOoD7MqiErKWriGWnYVt/8RYNKAyAjrOdUxOzPihL2qqlpLdi
 sv/Om1p9rvRJKpgWEmHh0dsvRaml1DF8
X-Google-Smtp-Source: AGHT+IERvUW3VpS1dSDrXTrDdG18SQ+azPUEfNK/FP9Z2UUpB4dCg4KTRRiDgC87/h3fIHA+BrbXxg==
X-Received: by 2002:a17:90b:2246:b0:2ee:f653:9f8e with SMTP id
 98e67ed59e1d1-2ef6ab29349mr20898628a91.35.1733761492276; 
 Mon, 09 Dec 2024 08:24:52 -0800 (PST)
Received: from [192.168.1.17] (lfbn-bay-1-170-196.w83-193.abo.wanadoo.fr.
 [83.193.250.196]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ef6bf32bcasm6395805a91.23.2024.12.09.08.24.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 08:24:51 -0800 (PST)
Message-ID: <f85a2be4-f2ad-4c00-aecf-c045b7cd2e1f@linaro.org>
Date: Mon, 9 Dec 2024 17:24:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/26] rust: bundle of prerequisites for HPET
 implementation
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Junjie Mao <junjie.mao@hotmail.com>
References: <20241209123717.99077-1-pbonzini@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241209123717.99077-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=philmd@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 09 Dec 2024 16:24:56 -0000

On 9/12/24 13:36, Paolo Bonzini wrote:

> Paolo Bonzini (26):
>    bql: check that the BQL is not dropped within marked sections
>    rust: cell: add BQL-enforcing Cell variant
>    rust: cell: add BQL-enforcing RefCell variant
>    rust: define prelude
>    rust: add bindings for interrupt sources
>    rust: add a bit operation module
>    rust: qom: add default definitions for ObjectImpl
>    rust: qom: rename Class trait to ClassInitImpl
>    rust: qom: convert type_info! macro to an associated const
>    rust: qom: move ClassInitImpl to the instance side
>    rust: qdev: move device_class_init! body to generic function,
>      ClassInitImpl implementation to macro
>    rust: qdev: move bridge for realize and reset functions out of pl011
>    rust: qom: automatically use Drop trait to implement instance_finalize
>    rust: qom: move bridge for TypeInfo functions out of pl011
>    rust: qom: split ObjectType from ObjectImpl trait
>    rust: qom: change the parent type to an associated type
>    rust: qom: put class_init together from multiple ClassInitImpl<>
>    rust: qom: add possibility of overriding unparent
>    rust: rename qemu-api modules to follow C code a bit more
>    rust: re-export C types from qemu-api submodules
>    rust: tests: allow writing more than one test
>    rust: qom: add casting functionality
>    rust: qom: add initial subset of methods on Object
>    rust: qom: move device_id to PL011 class side
>    rust: qemu-api: add a module to wrap functions and zero-sized closures
>    rust: callbacks: allow passing optional callbacks as ()

Am I correct some patches are from Zhao Liu and got the
authorship inadvertently removed?

