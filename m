Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CBCCAC5A5
	for <qemu-rust@archiver.kernel.org>; Thu, 25 Sep 2025 10:02:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v1inY-00009e-Dr; Thu, 25 Sep 2025 06:02:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1inW-00008X-3c
 for qemu-rust@nongnu.org; Thu, 25 Sep 2025 06:01:58 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1inO-0005bz-MQ
 for qemu-rust@nongnu.org; Thu, 25 Sep 2025 06:01:57 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-46dfd711172so6413725e9.1
 for <qemu-rust@nongnu.org>; Thu, 25 Sep 2025 03:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758794505; x=1759399305; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=REXk0seohHucogRD5GD38sXvJj5vj3tcRaZynkpBQmI=;
 b=FQl24dtd9+/vrjoDaC3Em3VJ+lvr8fbTno3RciTZVk9XTVSSoqbtPLu1ajXSccrOEh
 rn9yFdBXvLwaL0osrrvFG1lxHBkr5PH8O5I6dh8Ir8XGTElSyu3O1jHoynUHC/bBoUVv
 qOHsN20jU/zNz/doV6pOEOYcRx4gm6UQYDID6da9P62FP07EuNzFBSaJr/VQcf9RDUbf
 l2ppzsRmnpcM0ZTYdTZYGIajWM4WNCPVJ+EVR8Z/VUoIVc8Pw5F3lJQPNIPk1XYN3m8x
 gkEmN0aEotLAyeWJiIWe6X332s2qbttsDkg4bbw2kKU/1KsoOKprTTI/A1ZKBubiMX1R
 l2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758794505; x=1759399305;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=REXk0seohHucogRD5GD38sXvJj5vj3tcRaZynkpBQmI=;
 b=NcS+isOmdjzuna4fyfQRcD6bj2BuK+Y8cmKZldxsJYcfAHm6ptZcMoseJg2L+y8/+p
 nNlgXdU5G70vKXvxvXgyxPgtvLEN1Thmw5dYUpAm76fSI3yhMzrompHWwWhHOKF5EiWy
 1nPHe67BBsbPGWYsdRQWqL3RrrJvCrEh+g7ZVRL8d5pPYopMiJ4ebQQS6mOZ7l0uwlwp
 /O7VNxHNnSu74lKezzUirToACvSJCKbFNI7H1+XzOZc+/UeAUFKRWGBMByJfuGWv1Fzm
 MZa8Kq+SRfwU/ACKB4sxRnOhAOSj4QVbdE0COeNxFAIeOuXF1iA2Jo0iFD8GBr3tj/EJ
 sEsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYx9klI1q1AU0fiHCnij3W/zK53dGRNpKpn65Ymb0XQSxVa4mOOc89hs4DC8rsM+BDU9Dk29enMlc=@nongnu.org
X-Gm-Message-State: AOJu0YwbY9EYRm3JiZu3PI5WMolubW4pPLQIcm0zoyvg5dd2tlCrnqBO
 Ccbev+tyxzqIuAsr1F+uNT4OyxpAgJ6ILBObTQxwj7cx71AYhQr3n1AptG6RonvkXOw=
X-Gm-Gg: ASbGncsmN7lPPFd7zltiQbGwmUvvRez0Lzyf1gjw7ZoQ8PCr0h4dQE+RIE3wQdGHZPF
 paG3iLZeI/KIt0M11tuOCyg1UpotR95DKAG4bNJgYl8F7KF+FlpSC6opdx2LlvBMhuBzvnqlOrZ
 pyC5aBvRJeIkTu3NaJpxqkAC0IZRNlPZdjMk9pGH/03F3IkoSZqDzl1qDNToenkxebwKAY+MnHE
 vFplCfHSpAXfKPDMTF9j01wSE11xeEBLde857MeSuDvgrKuAD0Ugk9g6W/uoZosCHFaZIFXNfJU
 4v89DQ00JrSauY2KBrhwVPzk2wOJC0n1/9v4XgiT2Qdq1vJjc1DMDQsXUkGvFR8ZAzlr/yl4XFh
 sk4AomjC2nklNEtEz0Sj8dxJ4szby7EWN6qSCZm+l35pxdZaGKiDkBJ+s/sS43sSFJQ==
X-Google-Smtp-Source: AGHT+IEeYCMFlQQufiuQMFCwcH7XNfX4sCCXibRiuOpKTxYId0gHMBCbbB9f6WRIFbN+lwdG3Mv5pQ==
X-Received: by 2002:a05:600c:4511:b0:46e:19f8:88d8 with SMTP id
 5b1f17b1804b1-46e32a54d21mr24750365e9.34.1758794505080; 
 Thu, 25 Sep 2025 03:01:45 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e33b9eabbsm29409755e9.3.2025.09.25.03.01.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 03:01:44 -0700 (PDT)
Message-ID: <5b72b061-8516-4ea4-80c6-43b3f5eafc8c@linaro.org>
Date: Thu, 25 Sep 2025 12:01:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 23/23] util: add brackets around guest name in message
 context
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
 <20250925094441.1651372-24-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250925094441.1651372-24-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
> The message context can optionally include the guest name if the
> argument '-msg guest-name=on' is given. The formatting, however,
> does not look good if the guest name contains whitespace. Change
> the output to include square brackets to demarcate the name.
> 
> Before:
> 
>    # qemu-system-x86_64 -object tls-creds-x509,id=t0,dir=fish -d 'trace:qcrypto*' -msg guest-name=on -name "fish food"
>    fish food qemu-system-x86_64: (1146846:main): qcrypto_tls_creds_x509_load TLS creds x509 load creds=0x55657e94e690 dir=fish
>    fish food qemu-system-x86_64: (1146846:main): qcrypto_tls_creds_get_path TLS creds path creds=0x55657e94e690 filename=ca-cert.pem path=<none>
>    fish food qemu-system-x86_64: (1146846:main): Unable to access credentials fish/ca-cert.pem: No such file or directory
> 
> After:
> 
>    # qemu-system-x86_64 -object tls-creds-x509,id=t0,dir=fish -d 'trace:qcrypto*' -msg guest-name=on -name "fish food"
>    [fish food] qemu-system-x86_64: (1144713:main): qcrypto_tls_creds_x509_load TLS creds x509 load creds=0x5604ada2c950 dir=fish
>    [fish food] qemu-system-x86_64: (1144713:main): qcrypto_tls_creds_get_path TLS creds path creds=0x5604ada2c950 filename=ca-cert.pem path=<none>
>    [fish food] qemu-system-x86_64: (1144713:main): Unable to access credentials fish/ca-cert.pem: No such file or directory
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   util/message.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/util/message.c b/util/message.c
> index 814ca0316e..7d94b9d970 100644
> --- a/util/message.c
> +++ b/util/message.c
> @@ -28,7 +28,7 @@ void qmessage_context_print(FILE *fp)
>   
>       if ((message_format & QMESSAGE_FORMAT_WORKLOAD_NAME) &&
>           message_workloadname) {
> -        fprintf(fp, "%s ", message_workloadname);
> +        fprintf(fp, "[%s] ", message_workloadname);

Squash with patch #20 "util: add support for formatting a workload
name in messages"? Anyhow,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


