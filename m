Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uCzDm-00004q-9m
	for mharc-qemu-rust@gnu.org; Thu, 08 May 2025 07:15:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uCzDk-0008Vu-Rj
 for qemu-rust@nongnu.org; Thu, 08 May 2025 07:15:20 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uCzDj-0003ET-9A
 for qemu-rust@nongnu.org; Thu, 08 May 2025 07:15:20 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-22fa414c565so3209815ad.2
 for <qemu-rust@nongnu.org>; Thu, 08 May 2025 04:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746702918; x=1747307718; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZoygyoQ6JaTgf0lGZ8kSEymwPxAeuA1Rm+7OQNYgvT4=;
 b=laalllsPU8jvu3dTU37T5085byyn3xKuI3jORBGfowrGFMcvFPNWYfV87TRueFYO6j
 WfHrEoVi+nELq0gcaNF0sQ566kVpsdNwZzfzUyMI0QoOr5wAqzs2jRpk1QgtMOnW6Mzz
 zevka2S0TJq60f3E3pRckMW17+I/q5nWocRpWD5WMopceFX/5PqaR4/QpXaSGKvfG42J
 ejtX8ZWUOYjQpy2bALnGkb3Qp4L/flkaDME9b7DHeHPDry5MQJRddJRh5zEoHeWSlSUG
 sEAF8P3aZ4m/S/5bm6QjGHMEo4o/4YhDc9lE4qYwsQ3Zo5GsXSUljRaGap3eCfyAs4mF
 JTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746702918; x=1747307718;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZoygyoQ6JaTgf0lGZ8kSEymwPxAeuA1Rm+7OQNYgvT4=;
 b=kDcUDMa0uCVOxoeVnCrJBBHw7RK6evq97m2uj9xEFoppykK/qCb6/0RAcJ8UJQFnQH
 whUDoJfne/fKWhy4iSf+Y4lNVTTdgZIUqPcP9y3P6AFYUd1FH/Rhy6q9xPnY/bJRxdyX
 8PjmTik7llsjrnKyYdnJzTr8HJhQkP9I7St22bnnW50DuHNO5oyL4i6y8hRJjyKLNaJE
 /xl2j+WURtUvN1WtT0YbutPVHcnasGunkeXA75B8Evl+aRB2OAuj8w1/gcFK7KQ++FHt
 vY3SKCgZRH/1HWmcbRIZaCT4KNtDlcuk0dkF5z0y9NBp67888fvf43wUcG+DGXlTY/NV
 EmRA==
X-Gm-Message-State: AOJu0YwFuBcs8safiX5i26iNb+IWX4amJR535pf6cLQ9d2Pd6keXeou8
 M67aTdCtOmnK9cUQ1CiUPJKdYTAuuTFMd+AqVqZ9npSlKx8ZXhvra0ISsqmpcl4NFGpg052+mdC
 JLt5YyA==
X-Gm-Gg: ASbGncvid8+MQJp7MedEx/t3pD3TKszDakSY8MnFyhvOkGnfd/8cysyE5tpz0Xi3XC3
 WLB/HmDDE2NttIOx5qD7/lzl2O/r6Kv8oQT6UN2HBlDkELKfuSgpWD+msqFhRa/5PDl/hJ18Fte
 X24/FBBaqh0pIjsWVqNrK6Pva4mkmKtPPONrYIKwPzj5f43zWEywqJROHAxuXB6rYYQaVlPX43B
 HIvl+aMWdabQHvgKCT8csbqtxWmrvboGdjr9pE6Pa0fkjbmXmZF8/v2Mxp0JpM16bXgxDwa6esa
 KrdQoie6NoR4WEtF+XGqo16czZjV/Wp2MwjDPlkWL5zRExUIi6GGZygPeEaZHLqAJYnLNHAiM1j
 9iZGeYaB2
X-Google-Smtp-Source: AGHT+IGONAW+hD2eF+8A3Hp0VPo6ruT0PGfiiKdyY5H+/DFGDqcszwpqDqttfrsKL4TrKy4xfZKuEQ==
X-Received: by 2002:a17:903:22ca:b0:21c:fb6:7c3c with SMTP id
 d9443c01a7336-22e5ea78834mr99727305ad.17.1746702917752; 
 Thu, 08 May 2025 04:15:17 -0700 (PDT)
Received: from [192.168.69.244] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e150eb6e8sm109920955ad.26.2025.05.08.04.15.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 May 2025 04:15:17 -0700 (PDT)
Message-ID: <c2432666-bb9e-431c-b1ce-50360046be71@linaro.org>
Date: Thu, 8 May 2025 13:15:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] rust: pl011: Rename RX FIFO methods
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
References: <20250508082943.446512-1-pbonzini@redhat.com>
 <20250508082943.446512-2-pbonzini@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250508082943.446512-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-pl1-x633.google.com
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
X-List-Received-Date: Thu, 08 May 2025 11:15:21 -0000

On 8/5/25 10:29, Paolo Bonzini wrote:
> In preparation of having a TX FIFO, rename the RX FIFO methods.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   rust/hw/char/pl011/src/device.rs | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


