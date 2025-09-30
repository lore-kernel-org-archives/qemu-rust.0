Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD3ACCA46F
	for <qemu-rust@archiver.kernel.org>; Tue, 30 Sep 2025 07:51:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v3V8Y-0007he-Ss; Tue, 30 Sep 2025 03:51:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3V8W-0007eT-Mh
 for qemu-rust@nongnu.org; Tue, 30 Sep 2025 03:51:01 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3V8F-00065S-GI
 for qemu-rust@nongnu.org; Tue, 30 Sep 2025 03:51:00 -0400
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-46e542196c7so9429335e9.0
 for <qemu-rust@nongnu.org>; Tue, 30 Sep 2025 00:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759218626; x=1759823426; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y8j4W+R/URECxeEEsyU8+miHjytn4QNX67gizfKbh48=;
 b=JkmI+kzRXAeH86Xyn47Agfb0VbYIXtItYg2DKSJgvErmJusil10s6XO3dTIgzd380J
 v+6xTJx9Y7zliFDFFgDQ77aj0RD6Mk7WVxCW00U6e/y6KiFLqeL+dDdXlFTAT/n9wsYP
 jJ6CqE2JsPEExA9rEUjtc38f7Cg38Uneh4NmM8DvZstUi1n+QqSZsHItWXnVH8CpSMF8
 5VSVhQA8shkLSdBDLdBfS8PtKbmVKjjlIn9ID2LWYJkeHrPVuCCiT/dkun4ZrXP5kQjp
 kKUkuhFqktvk12v7bZiRB03C3lSAtott3Hjhm4H5z//r3JUaeYCidsxE8cpHT5d82fWB
 6jUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759218626; x=1759823426;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y8j4W+R/URECxeEEsyU8+miHjytn4QNX67gizfKbh48=;
 b=SdrGYZwt7POMSDJHaBtduptdWGUUe+ujuO9InszY0ggMehGxnkn3oX4SiJpYGjr7Ad
 Twzp1EsdKYlooh/jS9B4lrKp76Qc3VMoWwSTVCzgTE5ThqF9nhL7GSUr5oAi+E+hXQAr
 yZQwY9Icn22rz/NQegmX2nvKihT7JMWswJru9dEZAHRNfRdltPaKbzWSHrKxiX7ujm55
 hg0cawpZmUEIVSj1bZSXyl3jxPi3OWwipE6Rfwc8Q+KGO3ZgqoWjGeG/FX79dRkPMIhp
 bZaOyIeBDP5MqgETHb3WkX8I1wj00Xlg2S3m805YvpZ0iWV+3UzqBRF/2huTk9CDwyB8
 ovew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAHHb29DbhcZesDDLxbbtxXW8czlAbL9MLO+C73zChNVGqN4+p34nsZEcCDH/4gLUuuNZ2UzBiwsE=@nongnu.org
X-Gm-Message-State: AOJu0YzMKYW7TwNo+xURT6Aj4mbFqu9xhk9EQ4fYRi3AUCFZ5prVuzoG
 x+FS+It953/sj+Ub9HklDYxE9o5r1RvnNoU5KFEtrxRR+pt5GMLgS4Fe7jUZXgZqoa0=
X-Gm-Gg: ASbGncuz8n8gPalkfozkRb/XePoIzOY8IrQycGuMzeWDK7OIJqJ40dVGBlzr3POuYeM
 uLEA9viss+J87kDqOCT8+E+bgwFN9gLYYPEAVQ+r6NebyeglHUFu7IZ9kt0MWZEeJUcK1EVT0TO
 humxSODYIVCa7Y3dAc/06fsfSLFAgRAQwJUmqEZHHyqHXvLCT2Y/4TjTX/B6UCL/61FYJGVK5bj
 IkYXhrhvj/Pz2YR0+52EUGLHnDKD0P1KrqMebBmeyNfzpD+rS0zr14nWDYIZ6BeUFspJalppZtf
 bsBWY5WL4L4i0Yp2l+2CrK4GsreW9eSZDYRIv1q3HfSCzz38RmtrrZg23kRyF7ZBRNatJA5Flfu
 IBXPIz+YgzffutGD1tHP8pwlVmgdMZxgTQOhQMciwS6w4z4JvTw03tQ8395qA8xlUVL9PPqgFRd
 q1fkjGdpjPQMZ7Uc6ums89fPGx
X-Google-Smtp-Source: AGHT+IEcGthKVp9sosw2Tu42xE6fYeHXlaNk2SEgwcv58KDhLjaWiD2LXOi5JRucN+31lPEmZfOBtg==
X-Received: by 2002:a05:600c:8b85:b0:45b:8ac2:9761 with SMTP id
 5b1f17b1804b1-46e58e7b4admr31580135e9.13.1759218626084; 
 Tue, 30 Sep 2025 00:50:26 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e56f77cbfsm46285435e9.18.2025.09.30.00.50.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Sep 2025 00:50:25 -0700 (PDT)
Message-ID: <675a6965-7c32-4b4d-8d27-88acac0c440d@linaro.org>
Date: Tue, 30 Sep 2025 09:50:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] subprojects: Update .gitignore for syn
Content-Language: en-US
To: Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
References: <20250930075351.1853721-1-zhao1.liu@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250930075351.1853721-1-zhao1.liu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x343.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 30/9/25 09:53, Zhao Liu wrote:
> The commit a530a8d4ac39 missed to update syn version, this is because
> the code base of its v2 patch has fixed syn version, so that the fix for
> syn were lost during the rebase from v1 to v2.
> 
> To rectify this mistake, update the syn version.
> 
> Fixes: a530a8d4ac39 ("subprojects: Update .gitignore for proc-macro2 and syn")

IIUC the subprojects is in commit 9a6d6ae8afb, so:

Fixes: 9a6d6ae8afb ("subprojects: update proc-macro2 and syn")

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   subprojects/.gitignore | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/subprojects/.gitignore b/subprojects/.gitignore
> index 58a29f012044..136e30cd99ad 100644
> --- a/subprojects/.gitignore
> +++ b/subprojects/.gitignore
> @@ -19,7 +19,7 @@
>   /proc-macro-error-attr-1.0.4
>   /proc-macro2-1.0.95
>   /quote-1.0.36
> -/syn-2.0.66
> +/syn-2.0.104
>   /unicode-ident-1.0.12
>   
>   # Workaround for Meson v1.9.0 https://github.com/mesonbuild/meson/issues/14948


