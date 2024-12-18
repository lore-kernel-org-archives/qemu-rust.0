Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tNtzK-0007Rg-MH
	for mharc-qemu-rust@gnu.org; Wed, 18 Dec 2024 08:21:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tNtzB-0007Qu-C7
 for qemu-rust@nongnu.org; Wed, 18 Dec 2024 08:21:12 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tNtz2-0006h8-A9
 for qemu-rust@nongnu.org; Wed, 18 Dec 2024 08:21:07 -0500
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-728f1e66418so5676450b3a.2
 for <qemu-rust@nongnu.org>; Wed, 18 Dec 2024 05:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734528057; x=1735132857; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wd0XUmjdcfVtYA54yQSjmI0QoTn/5+Ke86U4Hn/dNFA=;
 b=vx5wkR6X6SyaVYn/Gnf82U6uiXdCWE17qmZXJZe2nfafi7pIb5oK454QWTlfbNfUm1
 g0EYMJ6zLoh5byTYACW+b0mKcQl7ANxPLb96IYM8gI+Ua7p4UPmelBgO53JRp8emOpyu
 aMJ4zGLg4Vg7mUrbhnVggnDmk68orbSGyvnnweSBi+jQaxUnRbWYRpGKIXqVrv5pL2yG
 9nVAHVbmyalbNQV0zhuUtGH4rXKdETf5tRkL6JrhixDsPwUDmaQrh85r2XEYvLLGbHIt
 BfTuMor6mh22iL2a6ZEkMkeLW3bw1ZTif5Fj9VdBDTsenbFj4CHdtONx8X1XMc0MvAgh
 QZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734528057; x=1735132857;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wd0XUmjdcfVtYA54yQSjmI0QoTn/5+Ke86U4Hn/dNFA=;
 b=sZ+6eI+FTYJ1fWqrEYQa7ehbZxW8AYkZxlCLMs92uLBlJ8Ft+jkhYJWqKdH28XsvUV
 iBkEkacgHjhL/oGkiY1q7YVGCkks6GmuelRjMWc5SFGvtjtpSClJOY6ikubusaCRSjQk
 parcMgvPhvzRsYy083Bt0bgRQAhHzg8GelqXFSYBBzqDNqaULkpU6LU71EVsBPXxGM2j
 OgqaKCKqCofKYdUO1enBwZjE35LWColrxdsyANzxyV5pTreCbuVWSCTg152AKoc53+m6
 pzmQJaibwFpjqbAWHjJNeAs0IC7u307980SmYbKT3RcomWxeSTOvwYIBa+vDCpGR6YtZ
 bu7w==
X-Gm-Message-State: AOJu0YxJZuoKqpogJtljsPVG35kiZBUbYaiUs5RWIRGSmp2q30CjaWc3
 MuGejgK9zvtxYOJHGNSldstzBoex4hNYJyyvVeb7g68ZdAVHLusiQ9VLDI4yrq4=
X-Gm-Gg: ASbGncu4Afc8NjSFETBTHNlfuhh/Kx9NuhpoUc25t2iHUXdplMtTqi+Jy7tFRaods7b
 sFUCncK6KIrm37sAGyeHvxq5kbYmpGFpqvG2WwDt+9Umzr5QIsunYhXwkdHxBD3XASjchU+EBEb
 8tt6VppZ1/oBIcb6DMckf/rYJ5gUsvsITCDgTUaOUp3ngJXqmmF8EyHKJkr+tDfcUDUIPhQLPFX
 Sz27iLxPRSkQoJzUDMSbOp173qCkWs63JL4W5KTS8ZhIdG7D67SGa8NN3UpMGfmDk5nhaii
X-Google-Smtp-Source: AGHT+IEPvmtgjiT8ozC3Dx6MOPjjEcKSpvjkOl8tP8XcJDKiM8JMWNEH9XzAMJWVDpyHUtXI61TDNQ==
X-Received: by 2002:a05:6a21:3985:b0:1e1:a716:316a with SMTP id
 adf61e73a8af0-1e5b47fc5a5mr4771348637.10.1734528057189; 
 Wed, 18 Dec 2024 05:20:57 -0800 (PST)
Received: from [192.168.1.117] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72918ad8f34sm8502173b3a.77.2024.12.18.05.20.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 05:20:56 -0800 (PST)
Message-ID: <d6eb56fd-47d6-4271-a62f-7d6a4feae2b3@linaro.org>
Date: Wed, 18 Dec 2024 14:20:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] rust: pl011: simplify handling of the FIFO enabled
 bit in LCR
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
References: <20241212172209.533779-1-pbonzini@redhat.com>
 <20241212172209.533779-8-pbonzini@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241212172209.533779-8-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-pf1-x431.google.com
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
X-List-Received-Date: Wed, 18 Dec 2024 13:21:12 -0000

On 12/12/24 18:22, Paolo Bonzini wrote:
> Use ==/!= instead of going through bool and xor.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   rust/hw/char/pl011/src/device.rs | 6 ++----
>   rust/hw/char/pl011/src/lib.rs    | 6 ------
>   2 files changed, 2 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


