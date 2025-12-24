Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4E4E77361
	for <qemu-rust@archiver.kernel.org>; Wed, 24 Dec 2025 15:56:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vYRDE-0004Na-2A; Wed, 24 Dec 2025 10:55:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vYRD9-0004Jl-Ea
 for qemu-rust@nongnu.org; Wed, 24 Dec 2025 10:55:39 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vYRD7-0004nO-V0
 for qemu-rust@nongnu.org; Wed, 24 Dec 2025 10:55:39 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-477770019e4so51058195e9.3
 for <qemu-rust@nongnu.org>; Wed, 24 Dec 2025 07:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766591736; x=1767196536; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=npEbExO2NPwcQFEpbQtKNlF6vQFYnvhFMMub0gaojOc=;
 b=qCKZ+6FrBgMeiAOHndLjNjB7WrOj1ctFr28PSQwwL6XV9by2laHpuOZ9ONBiZCFpCh
 Ndp6Ewth71VjhS/lnngkBZaq+ftOtlItuklP6XC1TlW/4De6mQesVQMRT223hJy0SvE9
 yrLpupWOXcpu+WMCEblfbmy7J3WUKlvLQKS006W3moCITus8vRhaz4RItC5RsosCTYnB
 dYOGV+lmhgeyUCowICKT0fcH3cd1MnaOuvzXMG3q2Z7x+NnAAFi1QWRPGlQzL9JeD87+
 5xCO8cRR0dsMFZO+ljGRZtyGDXg+vXyBPamee70o40uSBNj9HiCaz1ElleWHdYEJTSKT
 3w2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766591736; x=1767196536;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=npEbExO2NPwcQFEpbQtKNlF6vQFYnvhFMMub0gaojOc=;
 b=DS+WAQbGMN+1x6PsL5cL/MvyBO3m7X8dDp2SfS3MswkdZffRNsjYsUO260O2TggxWP
 tWxbSqsmmubclerulPIvlp9GFC/Esq8UfDpEDHkMlW5XxT/MSYBP+YhT/VaUj2fWKQ0P
 UHuaJTP9jDW3Zkj+3G2XJlUsCO05Cu0HT4pfW0kjBKmAQlvXLNnIW0bdauhfBETKXim2
 jwc8+9FlnnWhLsOgn0Db8t3++9w7V06MDs4JIYKccNsDijYJwfvTGtv0erHBc2k87Fkw
 7dmzqwBmdX84jwuujTvIgUwKebO4H7wACQaWfoCtkU1UwXL82ULe4VE416bg8hjWuGix
 qDzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5VY2McRBXkVaVYWsQtMHCeLVf0NwWqqOUazvgCGdlzn1oADjNL2zb5zkFkwCrl/I/tNlkJNfa9gw=@nongnu.org
X-Gm-Message-State: AOJu0Yz+ZvmbQoyTD/q+e/KsBWgfHzsiegeZqS/D67+OWCQHZK2gsjk4
 GaA0YkswFJnSsiGgG6qwGaduAAj8U+bm2l5jthOQ340B+OkreA6KAZOYa6+V92JzHE0=
X-Gm-Gg: AY/fxX6hKJ7W/zkhS9LaFmB81pXXGSlCuNdPzbE/7XIC2aiCDDh27nocc1PDu630H5Q
 2rly0neGk/ESOwHZrpS+75JfImkdS0hRlXSdHQqbM+hBrHqkdWyd7pEmMQHqEZMlcwig5tmi5C4
 BwptQ9vVFrmh2wDYlMNhs9CsFShj53jc2fgbt0mxnprgFXqdN+GTpUDPZOtTPSI0E5cMn0ja0qX
 qgWZWSUC104M5+nhPapbJA2Ed3HNBNMoeHLgqEuAAgh+wl+YfOm78EmBMkMfveXxHPSG1sTURNe
 91Pjy6kgeBObqYzL7u7L4Dr8QDGsv4mmztokj+NK/6sfebZLPh4Nx2R1jpa13ZhVX/fq5nEM09p
 nEgIarSEWlVrYz6iJiEzz4vlXPYag9lPOt09KQGLNSKW2pcb6B4hhgSfAAzHRsukCcT0L6Q1eOI
 ajKutlWcFWSUqUGDkUoNkVO58s/lKwI0qryeRrp8cUyl+J
X-Google-Smtp-Source: AGHT+IH6YrP0J7OoNLwUVIhNEOOPWCTfWqIOTI8ZSx8Bpr7EAFysGzuq3ZWayQGGhbHdz1UWTDjoaA==
X-Received: by 2002:a05:600c:35c1:b0:477:8b77:155e with SMTP id
 5b1f17b1804b1-47d19553912mr223584775e9.15.1766591735986; 
 Wed, 24 Dec 2025 07:55:35 -0800 (PST)
Received: from [10.156.6.66] (188.171.88.92.rev.sfr.net. [92.88.171.188])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be2723d19sm381168325e9.2.2025.12.24.07.55.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Dec 2025 07:55:35 -0800 (PST)
Message-ID: <16ed1aa3-ada4-4c66-8e22-8d1a2fcf6b62@linaro.org>
Date: Wed, 24 Dec 2025 16:55:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] hw/misc/pvpanic: Expose MMIO interface as
 little-endian
Content-Language: en-US
To: qemu-devel@nongnu.org, Alexander Graf <graf@amazon.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>
Cc: Jason Wang <jasowang@redhat.com>, qemu-rust@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Anton Johansson <anjo@rev.ng>,
 Max Filippov <jcmvbkbc@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20251224134644.85582-1-philmd@linaro.org>
 <20251224134644.85582-5-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251224134644.85582-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

+Alex/Phil

On 24/12/25 14:46, Philippe Mathieu-Daudé wrote:
> Make the PVPanic MMIO interface behave like the ISA and PCI
> variants: access it using little endianness.
> 
> Fixes: a89607c4d0e ("hw/misc/pvpanic: Add MMIO interface")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/misc/pvpanic.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/misc/pvpanic.c b/hw/misc/pvpanic.c
> index c83247c4087..3e60b226e18 100644
> --- a/hw/misc/pvpanic.c
> +++ b/hw/misc/pvpanic.c
> @@ -62,6 +62,7 @@ static void pvpanic_write(void *opaque, hwaddr addr, uint64_t val,
>   }
>   
>   static const MemoryRegionOps pvpanic_ops = {
> +    .endianness = DEVICE_LITTLE_ENDIAN,
>       .read = pvpanic_read,
>       .write = pvpanic_write,
>       .impl = {


