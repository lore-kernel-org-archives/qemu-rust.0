Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uXM5R-0004wG-V7
	for mharc-qemu-rust@gnu.org; Thu, 03 Jul 2025 11:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uXM5Q-0004vh-6Q
 for qemu-rust@nongnu.org; Thu, 03 Jul 2025 11:42:56 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uXM5O-00052m-2E
 for qemu-rust@nongnu.org; Thu, 03 Jul 2025 11:42:55 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4537edf2c3cso82689695e9.3
 for <qemu-rust@nongnu.org>; Thu, 03 Jul 2025 08:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751557371; x=1752162171; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ntlonvLeCaKhhtUx/ayDLB+iJ8zvvDDgN8XCnp0Kqf8=;
 b=l7sqYBrmqMiMTh5/fNIPde2pUCwRmtdh/obMyag4yrUOehWls37rOgvzeZrjaGfSkR
 /O/7W97et2TLKcISDRvW2aeT3Pmh3K3ZqbCt+ziAmzzvA+WZl3XQId4yP3CxdN5WlZQ9
 KEExS8Cj+8f0JPR9GNlqsdizDMui/ZXaPp+0NEXMCj7Fmb6CD7pnd+D4h76xgqZBUeMa
 evlRT3fekFOtE1mvjOlTQFRTix3GLYJ7zDQTpGQ+CjQ45jRmFFB6/1ZZsLrdwEn1TTUX
 XiAKzJ6tZBT3L9BR5SyqZB6t3tmjGz3dp9NsVPZWgIweYOLr6RLKKcqHdTxpNKvsa53v
 yHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751557371; x=1752162171;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ntlonvLeCaKhhtUx/ayDLB+iJ8zvvDDgN8XCnp0Kqf8=;
 b=brEBA6ycE675ZIw5z2BlBENqHziYcEUAKFVWliSQYm6tjbZqwuiDR7Dadm/hncYvoa
 k+f+cp8KIo5kqT1YsunRX35aDnnYwsWTa0Cur+dnt81/VULjV6OKeCV5uucr+b55i9uM
 oBrOYn8/NFgK8dD3WtPiQfiDY2wgKml/TSy9trIFEnShInQS6+Ec3JDEmG+r1nWTu948
 EElEx8pxftJnanssnB3qFLbP0L8GWl3BvUjNpYt9E9LyXKSRRImzBkR3zLNhbtOohjnV
 gCo8FVyh/QP6p/SSWMglfebkGtKzrxeiyZu/DGJ6R7uKJAgt7wiMG1D41orbuYCL/rzp
 74rw==
X-Gm-Message-State: AOJu0Yzcq+1UVD+X7rtZQABzI6FFXt/rbwVWtoBGL78UvAb//sEq0Hvy
 krhU+Ufqqh/kJWn/BpaDfFMuvqIoF6EIhNvEHiNuz+zVjfH5UXu8K+du0kE15yFD9ng=
X-Gm-Gg: ASbGnctRPFeB4x6qH8asCnqyeUiE5pjYTNCPG4A281YkIEgND5r/IRK0SWb1GryPo/G
 3C1JF+9fZfWJBdaEHMlseoxsIXp14yd2BbnvTh0PuG/k8iYvvhKausiT+k3/KqdKSKGE/nKpIFz
 3VZW3INe33YYVZA9pPfGz2dKXDZ2aKQjB6UEDkSsdDaLDNmyEVpmRKxCZr9nsSBCIdVxvqsnlJd
 3xBmIkQUVtVBfKmInWKhzFftT+hMw5Kw7o5Wtjlf811sJfbqd9YY1T/5wEJ/Xta5BpY6qUhtd6c
 Uxrq9lkEPIuJucKpMwcNYcqSWC33AJZuIpnjAomncFRTPFGbHM0WsYx/DNZIUllMwXtEEjEdQDb
 gGoCpxZ/VcSVYq9z3zcc8fUjXlTDw/FVWnbb4jMNu
X-Google-Smtp-Source: AGHT+IHqAxkDw4k5ySFbRhB9iq50aBVHRWqsssUVzLGsjgyA1DuPYmM0JUsTGYsCZmkxBxuldqrp5A==
X-Received: by 2002:a05:600c:1909:b0:451:833f:483c with SMTP id
 5b1f17b1804b1-454a3c0740dmr72460755e9.7.1751557371101; 
 Thu, 03 Jul 2025 08:42:51 -0700 (PDT)
Received: from [192.168.69.218] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a9be0bacsm29120195e9.32.2025.07.03.08.42.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 08:42:50 -0700 (PDT)
Message-ID: <4def8695-076c-4348-9bba-c3c62d2f25de@linaro.org>
Date: Thu, 3 Jul 2025 17:42:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] memattrs.h: make MemTxAttrs into enum
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>
References: <20250703-rust-mem-api-v1-0-cd5314bdf580@linaro.org>
 <20250703-rust-mem-api-v1-2-cd5314bdf580@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250703-rust-mem-api-v1-2-cd5314bdf580@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
X-List-Received-Date: Thu, 03 Jul 2025 15:42:56 -0000

On 3/7/25 15:58, Manos Pitsidianakis wrote:
> Convert MemTxResult defines into an enum. This will allow bindgen to
> generate a bitflag using the enum variants as its domain of values.
> 
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
>   include/exec/memattrs.h | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


