Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511AECAC5A7
	for <qemu-rust@archiver.kernel.org>; Thu, 25 Sep 2025 10:01:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v1im1-0007WQ-8G; Thu, 25 Sep 2025 06:00:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1ily-0007Vm-Mj
 for qemu-rust@nongnu.org; Thu, 25 Sep 2025 06:00:22 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1ils-0005FT-F0
 for qemu-rust@nongnu.org; Thu, 25 Sep 2025 06:00:22 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-46e1bc8ffa1so7980545e9.0
 for <qemu-rust@nongnu.org>; Thu, 25 Sep 2025 03:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758794411; x=1759399211; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Kbg/olOfDDAJizAOGCeWDXq3GdRfvd3vml9WOGx5tlE=;
 b=jZVWC1WGbQ2czocglAS3hA/++HWJNSD0IKcMK3yG6albH+jAeeEfbVcvA+REe5Cjrg
 P9fG/xfUrExfeo/jXtJ32BlkeHZD0dB5C4XTVSXGGW5/gEyV29Mf7gzmUegdMMmXxcAr
 1lGZnhTEJiFtU7Ld7cdx0S6iopxGjZJ67t5IvjGxYa14GAMsGpXnxbwS3UEnNr3SG8bB
 u/pcy09Xp/wRUqqoFmHdpWak6xrDm7feUoYYh47Lvm008bVrevgSD1COgz0V7Ekt09xa
 xM8SEgi0p9NfRJ3rMG4Fz6INato5555DkeRYOrMQRVYr6odpNsrsTUlwTLwobLc7RcWv
 t6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758794411; x=1759399211;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Kbg/olOfDDAJizAOGCeWDXq3GdRfvd3vml9WOGx5tlE=;
 b=K22zMFXhz3xnbmKJ2WanEazdsJrafDt205zRcShJHaJfy5Yt1+sK7je/89mFdWiS0j
 GD7MTEfLdPi7IDvEp4PAiAuKl8csAH1P4TwPSZY1TR9yeHqkmmK8/FQ8GJIzKr3jx4A1
 8iAPLTG51OhLcODl8gMzoL3jhkHGLhWyNXxLLaAm7y1HATC/cxvF6uAtKPfzI3kXVVHC
 H2Eu3PI1/DkHyHZ4jiRzHTAb1+NSdW9f/GcJALZBkcCRaffcD7/wpS8ltuEElKGMALKl
 ywo84SB6XBS7JGdoB3h+httKBMmX+eZrmymup4gnn9BF/nqAMA6skN7aARKHuASjE9Ds
 bhqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhy21BDrugwphvW4ymNmucBZjoLaW0/AGxXsjQ9LrZRsqB02D0+QhtOIBrvlvO2hccgKeXVWzPnxY=@nongnu.org
X-Gm-Message-State: AOJu0YxORl8UqIp70H5tZmhN3/pzTbapCMV2giL5cX1oLKMZGW19rdas
 UDbzpF+HTJ9RW2UhJjCniFIdS49qJT90pGa//V9NTKrrClgT3UJoqOp8Dhis40o9g5E=
X-Gm-Gg: ASbGncv8ruU18Ngr6mvZxz2Pb8OYaaVjYENDl2mSfzQHeR2HD8XG4j9m2oYtOL/hBX/
 fd+w/YdBWGWwJzlnI9hcO2/qFgLnbYAiV6BE2xuW4s4DIaTxVmslmmtzS6VprZHLXCQSZ0hR6OK
 axizUzy5zs3yFVJ22zzyJJ6RsNkkciaPXHoXj5nvQ63S3v20iDysDWHelgz0Xp8epq7ngoGopfh
 XY2vbEKTvegSwWqEok1KMAJukjXjr8kuT+gFh+VpDvY+7fyj8n2XS00kkgCT8iIkIJ53ICV23Fc
 8Ozp/ch+U1Op+mNdQNHXaCnMIZAKTYT8CcxUWtdMK2xtSGpr1DVWkLZkg8jUY//H2YoiRgAcep+
 UwrGAs5rseSqNBnXaGpAAcVGqvvK5L6tkZQTaNtSKzHF6mbap7Ko6f+Q24fxjTXCyyQ==
X-Google-Smtp-Source: AGHT+IHDpvitrKKvon1jR7YJ8fPY5liFFhfX8fBbZq/lvk1t7t1t28KENnJPDEN09jH/W7nIhTT2Kw==
X-Received: by 2002:a05:600c:45d4:b0:45f:2ed1:d1c5 with SMTP id
 5b1f17b1804b1-46e32a26e4emr28246165e9.36.1758794410980; 
 Thu, 25 Sep 2025 03:00:10 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb72fb711sm2369336f8f.11.2025.09.25.03.00.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 03:00:10 -0700 (PDT)
Message-ID: <b1fb0134-7e41-4e82-8de0-ac9e7800ea70@linaro.org>
Date: Thu, 25 Sep 2025 12:00:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 22/23] util: add support for formatting thread info in
 messages
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
 <20250925094441.1651372-23-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250925094441.1651372-23-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
> The message context is now extended to be able to include the
> thread ID and thread name, after the program name. On Linux
> the thread ID will match the process TID visible in /proc,
> while on other platforms it will merely be an integer repr
> of the system thread object address/ID.
> 
> This changes the output for both error_report and qemu_log,
> when running under the system emulators or the QEMU storage
> daemon. Other programs omit the thread information since
> they are largely single threaded, though potentially it
> would be useful to enable in all of them, given that the RCU
> thread will always get spawned by a constructor function.
> 
> Before:
> 
>    # qemu-system-x86_64 -object tls-creds-x509,id=t0,dir=fish -d 'trace:qcrypto*'
>    qemu-system-x86_64: qcrypto_tls_creds_x509_load TLS creds x509 load creds=0x560db818e080 dir=fish
>    qemu-system-x86_64: qcrypto_tls_creds_get_path TLS creds path creds=0x560db818e080 filename=ca-cert.pem path=<none>
>    qemu-system-x86_64: Unable to access credentials fish/ca-cert.pem: No such file or directory
> 
> After:
> 
>    # qemu-system-x86_64 -object tls-creds-x509,id=t0,dir=fish -d 'trace:qcrypto*'
>    qemu-system-x86_64: (772366:main): qcrypto_tls_creds_x509_load TLS creds x509 load creds=0x560db818e080 dir=fish
>    qemu-system-x86_64: (772366:main): qcrypto_tls_creds_get_path TLS creds path creds=0x560db818e080 filename=ca-cert.pem path=<none>
>    qemu-system-x86_64: (772366:main): Unable to access credentials fish/ca-cert.pem: No such file or directory
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   include/qemu/message.h               | 1 +
>   storage-daemon/qemu-storage-daemon.c | 6 ++++++
>   system/vl.c                          | 8 ++++++--
>   tests/qemu-iotests/041               | 2 +-
>   tests/qemu-iotests/common.filter     | 2 +-
>   util/message.c                       | 7 +++++++
>   6 files changed, 22 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


