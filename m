Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4066BCAC5A7
	for <qemu-rust@archiver.kernel.org>; Thu, 25 Sep 2025 10:00:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v1ilp-0007TU-Fb; Thu, 25 Sep 2025 06:00:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1iln-0007Ql-G0
 for qemu-rust@nongnu.org; Thu, 25 Sep 2025 06:00:11 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1ilg-0004yd-7v
 for qemu-rust@nongnu.org; Thu, 25 Sep 2025 06:00:11 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-41174604d88so167760f8f.2
 for <qemu-rust@nongnu.org>; Thu, 25 Sep 2025 03:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758794399; x=1759399199; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0D8VYsERxYsdDOSRB8zy7d8UqOpAtvqsTpZuHWuKJec=;
 b=YBQXMkL/ed8a4aLSu4xQAH/5r3Es4hsdKdJUnqkyZyjwyBmrvxr6MNLev7yL83o3TW
 OFi30cJ+oOuo+jUpbRkZ1PJEEkyxgVIbWvjVG9ocbZzowCkKss6BvPruog6QjbTBYy24
 DjL4FvJdD7wdNCTFnnnwpYwod5o9AL3WzW7Z19VfVq+9t07Hh4Mwn82Rm2VhLOwp8zB6
 AlresUVbAQXPeqOw/PpoJRMbg397sA1ngly1TJRzzZmHNioIk7T3SQBTz2q1CHY/ziRA
 5UYEuhHk5zbOfuJljL1Zz86Oi4rPsWZ6T1IQrX2ORVnl2XvQSIIz7uG7Fu6tKHeSb8yT
 iwdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758794399; x=1759399199;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0D8VYsERxYsdDOSRB8zy7d8UqOpAtvqsTpZuHWuKJec=;
 b=hJ7j6AyEcyv0VmhxTCMM1wVUaLaJSm54q77i+KQrkJoMLUVbw4T0CDpAf3WUiMX5UV
 Yp2wO5cQim2VVNxAMMhxetFRq8q5Pq3uG2hRe1mtPdGkaXtqa1UC8VTQ0uIRyxkHW5SP
 Edw8LFqHOsHMRnPj2PKcBTV+ldPLtQhQMpa9nCmG7wqwpmJbN/a3LbRt7EFmVpNPTBuI
 zUCcP7uRziIlNfNTVtn5t4M6xydt7HJXKu8Xl/5ExWZtmvYDSBzYaE6RS/fBTCIZjmHW
 efoben8SdFxgtGA8bQJJ4vuCuMGK8NJPXPeINUTh+yvm3iPYmQ5ijnEiPFlELs5P0VQK
 3Mtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLQjuJxco6B+lHtvv2RSKPyOZz+riFhMHLtjIwLAPh+aAC9NiDW8Okm+0hOzE/Fc8u9M6sIyc5jvk=@nongnu.org
X-Gm-Message-State: AOJu0Yw60W0k0vR3/SZbwrOhVKIvhLdsIWbRuM036rZxgiUNv3uSz0/N
 Tn/+1Wi6sQR9TpUJi25J+lDoFgqGwfbVaNGKzWJkqPbvto6ohkPz59KoBNheqD3wde4=
X-Gm-Gg: ASbGnctDH4Z7Y5vo7oR91MeX9PWDbcyFdHD+PxkAgURLNaGkmVNOFlwKMCxnPNQOl/w
 0MZF8hKKRnNOgUhMBalvDe1KhMdx5ebYd85yNaCQy/hLCVVz92dNABq9goTMxDNjzaCXcmX6pnG
 OO+3dUo3te2cvow1uxu86dbSBppTedebnZghjQ0xFBhRV7/D/ti1DILmEshZw28tSscKubdHXOs
 2lMMt+FKPtX4so6TyUbnZ2Pg2kCxiSEkI8o8Oa7Tg/X2KqxapjSIDQI5PvwzgNeNUIIqiT8nQqR
 ZfH6xI6bb3VtVpQA2IsI6TKOA/PkoJh+II5Z8mDVx0R7SBtlfwuKcr60I5DqWLAR6UWnk90GW9/
 3kYhpeeNzNa+lGWJtEvYpGcibpdSuQ3HhvYLeKXx8fgDQYy+aIntYoajp7RsW/q6LoA==
X-Google-Smtp-Source: AGHT+IFkDthF4ugBqKPTQoNbkJuLF2QPdQ16D8CmTTwH3bcF2qzmveU8b4EB0yx6+xUUU2XltGHQ0A==
X-Received: by 2002:a05:6000:4007:b0:3ec:e152:e2ce with SMTP id
 ffacd0b85a97d-40e4a05c568mr2500698f8f.32.1758794398697; 
 Thu, 25 Sep 2025 02:59:58 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb72fb71esm2304886f8f.1.2025.09.25.02.59.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 02:59:58 -0700 (PDT)
Message-ID: <f54f589a-a5f3-40b3-8b23-4af14a364740@linaro.org>
Date: Thu, 25 Sep 2025 11:59:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 21/23] util: add support for formatting a program name
 in messages
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-rust@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-block@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, "Dr. David Alan Gilbert" <dave@treblig.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, devel@lists.libvirt.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20250925094441.1651372-1-berrange@redhat.com>
 <20250925094441.1651372-22-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250925094441.1651372-22-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

On 25/9/25 11:44, Daniel P. Berrangé wrote:
> The error_report function can include the program name in any
> messages it prints. The qemu_log function has no equivalent
> behaviour.
> 
> This introduces support for a "program name" in the new
> messages API, which will be included by default for all
> binaries.
> 
> This change tweaks the output of the error_report function,
> adding a space between the program name and the location
> info. The qemu_log function will gain the program name. This
> can be easily seen with the 'log' trace backend, and how it
> is now more closely matching error_report output.
> 
> Before:
> 
>    # qemu-system-x86_64 -object tls-creds-x509,id=t0,dir=fish -d 'trace:qcrypto*'
>    qcrypto_tls_creds_x509_load TLS creds x509 load creds=0x5584e13937f0 dir=fish
>    qcrypto_tls_creds_get_path TLS creds path creds=0x5584e13937f0 filename=ca-cert.pem path=<none>
>    qemu-system-x86_64: Unable to access credentials fish/ca-cert.pem: No such file or directory
> 
> After:
> 
>    # qemu-system-x86_64 -object tls-creds-x509,id=t0,dir=fish -d 'trace:qcrypto*'
>    qemu-system-x86_64: qcrypto_tls_creds_x509_load TLS creds x509 load creds=0x5584e13937f0 dir=fish
>    qemu-system-x86_64: qcrypto_tls_creds_get_path TLS creds path creds=0x5584e13937f0 filename=ca-cert.pem path=<none>
>    qemu-system-x86_64: Unable to access credentials fish/ca-cert.pem: No such file or directory
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   include/qemu/message.h         | 1 +
>   system/vl.c                    | 2 +-
>   tests/unit/test-error-report.c | 5 +++--
>   util/error-report.c            | 4 ----
>   util/message.c                 | 9 ++++++++-
>   5 files changed, 13 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


