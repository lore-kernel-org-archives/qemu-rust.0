Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tNu1H-0008CR-0p
	for mharc-qemu-rust@gnu.org; Wed, 18 Dec 2024 08:23:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tNu1G-0008C4-4E
 for qemu-rust@nongnu.org; Wed, 18 Dec 2024 08:23:18 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tNu1E-0007AS-LK
 for qemu-rust@nongnu.org; Wed, 18 Dec 2024 08:23:17 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4361c705434so46868485e9.3
 for <qemu-rust@nongnu.org>; Wed, 18 Dec 2024 05:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734528195; x=1735132995; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5R+q3EEnkqoIYML4dZGTYRvWcQAtQyPXlr2A56GNhRI=;
 b=EWorjAywRxnTvlr0EdTxD56JEa4L33M4YlppT8KGsTLY+QxZwbNLCE5jgRlIrortRf
 hm2bsEOLA3Ir/SwJvoFXohH1AUlFeuu8s+9oXoVsAp8EtT5a4isfrWUH4fiTJHP63+Zd
 U8WEleWfEReZ0HuafpYDeTjqKTjVQll/2gG3f3Wjcb3BtwenIP4Fb/SD+qeeWS3MUgK7
 9OC6DulehJTJoj0MIztzwGVCEfZL2oFuNq46125BkBNa8HV/uHNQI9v+4R4/eX8X4EFa
 VHgcct/YwexgIjcvLwqAfv4ypyqpl78TI8g5VeRQ8LGvg2sji40z/MF15y4MDh9s1LC4
 XY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734528195; x=1735132995;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5R+q3EEnkqoIYML4dZGTYRvWcQAtQyPXlr2A56GNhRI=;
 b=sQJg1Rmcm8+bhUgw8IZcHSZI79Tm0N4Y379c06P2Ti5bAy6dYKRWJmQ3MyDFggARi9
 L9rTyWxRxSAmLbbTC7XKw9PHfixifPmiNqkGxLxVUrRP8j2rTPpdsUHQtywNXoi0/3kp
 4pbTWy45Z/hSquAeFbxFGBpkzGzrTVSnIGpO2v8bG0pfyTSK9YyMu0eR5DmZmuYIMY42
 DTmXPDlF4LAddrQLln7stQKTQetH+PiV9D6zPF84ctd2NezIgc1QIaSqLbtgbWqv4ihb
 1chj2KMmqzNr6A5wQP3LaNg/kznHkba9v/kbLc8mxvZJpc8m5JEb36qZ2GaYdt3rQ9SJ
 DKow==
X-Gm-Message-State: AOJu0YySZmR9ddnXl+Mw7nIBeGyqCg0+qvw+npfzezLrmnCQacbNjRJO
 A8Bpv+6+Sv1do9Q3oOV0SMreQbYgnEW+xcXFyEAuDvRNiIjAiErMFfmXd/xFHv8=
X-Gm-Gg: ASbGncvJPeb742b5ruukN/pL2B78gA9jaJbhilboqlg4wud+/l7aBzrKIpZ4FgOkNEd
 uD/FXzK97fooJkSLlSbErZoep6piwxhjl3VR1yWLkKyvvqYGCLL1+QOzf9i5T3/raQtMW6CNkCK
 dPyZbuPBkH0J0lH0hJOZLScO2jsbIw4DWb5OzDa/UvvcP2sOiF7mXhalfxg6V01TF6DBqCv0jzL
 51szdZ43TPWfkbD7N6oln0yiRx1XbVH1NMlDnhUAkCbZ+YbXGDnKVKJ62SoATNTqwisbesm
X-Google-Smtp-Source: AGHT+IGiQcfHIa7orcQGPTW8DVBDnSllyf78Yu/RmNWep91TIs+vxLZ7xFsyQDV3uZf17vk/UY3A4A==
X-Received: by 2002:a05:6000:4703:b0:385:f271:a22c with SMTP id
 ffacd0b85a97d-388e4da3fcbmr2411054f8f.59.1734528193416; 
 Wed, 18 Dec 2024 05:23:13 -0800 (PST)
Received: from [192.168.1.117] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c801637esm13979100f8f.28.2024.12.18.05.23.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 05:23:13 -0800 (PST)
Message-ID: <c89e9f97-240e-45c1-afbf-cdd478077952@linaro.org>
Date: Wed, 18 Dec 2024 14:23:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] rust: pl011: fix declaration of LineControl bits
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
References: <20241212172209.533779-1-pbonzini@redhat.com>
 <20241212172209.533779-2-pbonzini@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241212172209.533779-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
X-List-Received-Date: Wed, 18 Dec 2024 13:23:18 -0000

On 12/12/24 18:21, Paolo Bonzini wrote:
> The bits in the LineControl struct were backwards. :(
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   rust/hw/char/pl011/src/lib.rs | 82 +++++++++++++++++------------------
>   1 file changed, 41 insertions(+), 41 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


