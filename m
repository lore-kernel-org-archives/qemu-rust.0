Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACC7CAC5A5
	for <qemu-rust@archiver.kernel.org>; Wed, 24 Sep 2025 14:39:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v1QeB-0000SC-Ng; Wed, 24 Sep 2025 10:39:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v1Qe3-0000Pv-QI
 for qemu-rust@nongnu.org; Wed, 24 Sep 2025 10:39:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v1Qdt-0005qY-H8
 for qemu-rust@nongnu.org; Wed, 24 Sep 2025 10:38:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758724726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OALPYfxAni7JNQY/VLyVPv/zHvQVsn5nIWiQpnM5Y3M=;
 b=FiPwuNrUTL8E6odJpapGDpu5w/hQyjkmUhoBig0NY8jnFLxQI6Udy3WylCiLCAoC97sfRp
 vx7T28BsxppV+ggzBB8C/JdOryptXGGQ90IuqdB/fjJsGJERv8/CyRK73oDbFsHCo4P6Ub
 NltcpaIZhGrZYVI2Y4uAXz9Pcrmb47A=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-r0dFDlUqMFKlsFRTm2aReQ-1; Wed, 24 Sep 2025 10:38:42 -0400
X-MC-Unique: r0dFDlUqMFKlsFRTm2aReQ-1
X-Mimecast-MFC-AGG-ID: r0dFDlUqMFKlsFRTm2aReQ_1758724722
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-b2e74dd6b42so262745866b.0
 for <qemu-rust@nongnu.org>; Wed, 24 Sep 2025 07:38:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758724722; x=1759329522;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OALPYfxAni7JNQY/VLyVPv/zHvQVsn5nIWiQpnM5Y3M=;
 b=ZX4CpaTsrOBmQ7QqetlFrRMiZxNU59RvcmFTQlqTHtOzJCKy/s2WG0abx77bCObP9o
 pwKaM7hBlXnTTmS9ytlYTrTwxmQdntTt2pPEQDirXrSA4dA6BIsaxXY+XkGX4JolinJ3
 Fe4X2Ha+Gv1ZG+htXD8uUSNZ2XtnIdWQi+wahdNyi+gWBjeQLi0dYqs9ahTLsuz0joGX
 /UwDVHNKGc4TxrmXnmfG66krZN+/W83QeNDRqqx6rn2URHqcld2T5X35gUxzA/iNUHn+
 cwHW5dpQghoCiITtlzlgUO5liUVo1mP7/CMMlTeNVLINnNCN47qodlQrSGSm8yXc5t9k
 FSEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbeTJj1NzHzk4a1mOWO+KUttzWsz5PyTWkXmWHyLYse17JxZtaVXtUVqqrJ58dUcQe6MuL6GMeaIE=@nongnu.org
X-Gm-Message-State: AOJu0YwneAy0bJr8De1YrrmaycXO+NLxDuNWzROaBEWoTHFz+NXLixn6
 ghtdkOSe28lE7/XtdZUsX1XVOQhIQbnturoa5K7RHS1UFUSI5GojxsZqKihFU2fhvrSi09G8bPg
 6CZl2cKAVHNvE2J0I+3r2mkpbLfwazNhgTwlpuIINYpO21sC42A1EjoU=
X-Gm-Gg: ASbGncutZSwrqxvyhPKphjEizxrVdy1Oq7zIp8NZ0ExDOc8R94zuym7bIV/eKoC9t6A
 dq5M1ffwgfrq0Qlw8iFKzaJC7RJAW2ej6o4CiPBREyz1DwaNLWCyPy4FgcRz5cct74U34m/7d/q
 Ua7A4btbZuQzZKyOS/cojrbTgvDt56PHhS0+7bPYu+W8xj6jjuMnutB9g20Cxd0ME/Z80NqWByp
 uVh6NzjaNKA5Zzyavd/FAP8OUXTchFr/YPc8Xl+sRYxrEDUc/FO3vswQGBFt3okE6p0oZ3sN61G
 tuybAU948ksR0Z1J1bz83VUv+FDCXFWdWEFEIP7xllxd3Zk2giPyAl0X3fsoZdLe8kPRXMs2lfw
 AYkqApA==
X-Received: by 2002:a17:907:6093:b0:b04:6a58:560b with SMTP id
 a640c23a62f3a-b34ba93ce11mr5854066b.39.1758724721728; 
 Wed, 24 Sep 2025 07:38:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtkF7WzASen4LWC81qDblxtzUi3QFq44xb5GOExMZWexnVTy36o6HFASJk/5FFXG1ACzd8LQ==
X-Received: by 2002:a17:907:6093:b0:b04:6a58:560b with SMTP id
 a640c23a62f3a-b34ba93ce11mr5851966b.39.1758724721296; 
 Wed, 24 Sep 2025 07:38:41 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-114-212.pools.arcor-ip.net.
 [47.64.114.212]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b2636394d79sm1233300966b.38.2025.09.24.07.38.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Sep 2025 07:38:40 -0700 (PDT)
Message-ID: <108caf59-b284-4894-adab-48abe5bed802@redhat.com>
Date: Wed, 24 Sep 2025 16:38:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/27] tests/lcitool: enable rust & refresh
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Warner Losh <imp@bsdimp.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ed Maste <emaste@freebsd.org>,
 devel@lists.libvirt.org, qemu-rust@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kohei Tokunaga <ktokunaga.mail@gmail.com>
References: <20250924120426.2158655-1-marcandre.lureau@redhat.com>
 <20250924120426.2158655-19-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250924120426.2158655-19-marcandre.lureau@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fMipPY7yICUoGNAeIryYkyTh5i0wKclFvypR9fY5U0s_1758724722
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.444,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 24/09/2025 14.04, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Enable Rust on various distro images: alpine, centos, debian, fedora,
> opensuse.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   tests/docker/dockerfiles/alpine.docker             |  2 ++
>   tests/docker/dockerfiles/centos9.docker            |  2 ++
>   tests/docker/dockerfiles/debian-amd64-cross.docker |  2 ++
>   tests/docker/dockerfiles/debian-arm64-cross.docker |  2 ++
>   tests/docker/dockerfiles/debian-armhf-cross.docker |  2 ++
>   tests/docker/dockerfiles/debian-i686-cross.docker  |  2 ++
>   .../dockerfiles/debian-mips64el-cross.docker       |  2 ++
>   .../docker/dockerfiles/debian-mipsel-cross.docker  |  2 ++
>   .../docker/dockerfiles/debian-ppc64el-cross.docker |  2 ++
>   .../docker/dockerfiles/debian-riscv64-cross.docker |  2 ++
>   tests/docker/dockerfiles/debian-s390x-cross.docker |  2 ++
>   tests/docker/dockerfiles/debian.docker             |  2 ++
>   .../docker/dockerfiles/fedora-rust-nightly.docker  |  2 ++
>   tests/docker/dockerfiles/fedora.docker             |  2 ++
>   tests/docker/dockerfiles/opensuse-leap.docker      |  2 ++
>   tests/lcitool/refresh                              | 14 +++++++++++---
>   16 files changed, 41 insertions(+), 3 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


