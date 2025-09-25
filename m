Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2EF0CAC5A5
	for <qemu-rust@archiver.kernel.org>; Thu, 25 Sep 2025 11:24:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v1k5D-0002Dk-9K; Thu, 25 Sep 2025 07:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1k59-0002Cy-5y
 for qemu-rust@nongnu.org; Thu, 25 Sep 2025 07:24:17 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1k4y-0006f8-LO
 for qemu-rust@nongnu.org; Thu, 25 Sep 2025 07:24:14 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-46e2e6a708fso4769955e9.0
 for <qemu-rust@nongnu.org>; Thu, 25 Sep 2025 04:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758799435; x=1759404235; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lKfpWLcLZxX3dwZ2MMcCaXnBWBWK3vXluTyZSNNRS+I=;
 b=jjqZD4UAzQIwSNpw9CO1EiGp/BNp367fmIq+GX71+NZ97/ciy+/9367mzp5PprzZB8
 1bWxxoCeYttJ/dKr5+ioH+OsrlZxPACeutX+HB0Pv6Yos7vGlrK5ltgVHjxXF8h56r5D
 dcwaB90cMrY5iiOgOsgIQbbpEi6hKpaViBL71YJsg8Dto8mcBTdzYuDpijvd4CIiGfCa
 E+vBHKikTO3djS62j9Z9Y1rEXn0Os6zw58Tezo5Cq6h7BFaWCTOv89V9NEtq/te4aEvN
 g2zj+vLBlHIOni7CsSXjvq3supLg+uWNITp7vGguokaIixv6JSC09ah0AkxCWI7E5abO
 krtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758799435; x=1759404235;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lKfpWLcLZxX3dwZ2MMcCaXnBWBWK3vXluTyZSNNRS+I=;
 b=ru64zKxXzDAKfGo1pa2TiVbUUcah2yqFz/EI/ZgzA9duvJj4EPjpCtFP6UCHlFOoSC
 BDitYNlicm+R/VeiT6H/84X8SEJ99cVKom8aNWQke+c1xwAElAPZD2jcJopKoUjSAeMp
 wUmxJUFxTx9p2fFJfVMiPUT2ONNQq6wDwwSE4CiodARWe6ygjQoeJ45pTRFq5TvA0Ni/
 mV3E/k8CuuOLDQfxZNPHRoiQC7AbTuRO2Z+4W6oIHMDoOQvgC5h0bk5kmS+G0h+/ha29
 AK0Xkl4zBDaQ7x9WSb0AbQt4oQF95iJfJZKbZHy0wshGddwJIX2ZT2w1U9iXvp9UY19y
 XtoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR7zvN0mGFio1isHKFBULGAStAzdHqBAIkKn+ly92nKGvMheYVdBVCOg4kv0jai953hJWl5V+Ot6Q=@nongnu.org
X-Gm-Message-State: AOJu0Yx+UdhxlRfiCX0Qb4gOf4sRs1NiAcV8uWD3E8HMw4O1dbSU/6Q7
 XENsMox2L30rLz4Lbn50AT+fSRZIqtyMUrGQsIT0qE5SKhO0PLfJ/itZG+CX1zLBGcs=
X-Gm-Gg: ASbGncvrzjgUnNCaLY7/CmPtuU1nCi0SJfwDfJMz+otfuZRlAG2GFdtBeQcKodnTYO1
 HqjhJj4lCvoZgRuuMSCQezlt+mr/IiCiqzkKwGWlOCo87GN0p6IAUB8ibst+41ZuAKFYN6FP3RH
 aUnVRrZv28TU6Ux4le1nmCY6z7spaoLqigIKMRYJPGmOQN2sWPN3t0swoa/gCpAAGSy1Znv7x1F
 IFyRYS8WI6z+ZqSQ1WuCbucj74GYgZOJ0PcPqmwODwZ4ZIk2fBkPw1xnpEiiYO0ISGNJxk/+Kru
 icakB/PSBUvqt9JoSZy0dCtotDxpQDt6cHisdSSJnv8kZc6VGJBx6NIen4siSVRh8eaWHFOYTN1
 A8uKCvZeqpFCCv6ygHJn4luGvwQVhcH9dYqB/LZsGDYbm6tpakJvZx2NWbaTi3YFeHg==
X-Google-Smtp-Source: AGHT+IGRi4dpiWf5sUeqEhQ4znfq4WRG30KtdVLgLpafbhiuui/zUGob0ERcWzy27LIjZt8An0MCmQ==
X-Received: by 2002:adf:e6ce:0:b0:411:f07a:680d with SMTP id
 ffacd0b85a97d-411f07a6c0cmr670510f8f.0.1758799435461; 
 Thu, 25 Sep 2025 04:23:55 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb72facf9sm2727103f8f.13.2025.09.25.04.23.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 04:23:54 -0700 (PDT)
Message-ID: <0b2be802-ae8d-476a-94e9-4013097d29fd@linaro.org>
Date: Thu, 25 Sep 2025 13:23:53 +0200
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
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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


> diff --git a/util/message.c b/util/message.c
> index a91c008e08..1db9254733 100644
> --- a/util/message.c
> +++ b/util/message.c
> @@ -5,7 +5,7 @@
>   #include "qemu/message.h"
>   #include "monitor/monitor.h"
>   
> -static int message_format;
> +static int message_format = QMESSAGE_FORMAT_PROGRAM_NAME;
>   static char *message_workloadname;
>   
>   void qmessage_set_format(int flags)
> @@ -30,4 +30,11 @@ void qmessage_context_print(FILE *fp)
>           message_workloadname) {
>           fprintf(fp, "%s ", message_workloadname);
>       }
> +
> +    if (message_format & QMESSAGE_FORMAT_PROGRAM_NAME) {
> +        const char *pgnamestr = g_get_prgname();
> +        if (pgnamestr) {
> +            fprintf(fp, "%s: ", pgnamestr);

No formatting needed, use fputs()?

> +        }
> +    }
>   }


