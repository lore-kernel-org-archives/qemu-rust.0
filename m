Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE56D25031
	for <qemu-rust@archiver.kernel.org>; Sun, 11 Jan 2026 22:32:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vf3z9-00006t-VW; Sun, 11 Jan 2026 17:32:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vf3z8-00006B-1i
 for qemu-rust@nongnu.org; Sun, 11 Jan 2026 17:32:34 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vf3z6-0002lL-Af
 for qemu-rust@nongnu.org; Sun, 11 Jan 2026 17:32:33 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-34c565b888dso5013277a91.0
 for <qemu-rust@nongnu.org>; Sun, 11 Jan 2026 14:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768170751; x=1768775551; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=968TPBV7ZHk1pT1hJPYejxTybirnqoIcqqfUXHVKDU8=;
 b=Bnu97BU/MpxxYl/9Dxpi5wn0s7/d95IwZeZMjev+hl36xCYjWKGD4rViVflxI1RWBk
 JJAycopH1JORy/oUIXqdEBrOOwba7GAP9KZIXxOvftPDv3M32n0ZrVeqNklKyT/85MFc
 Z/L3VoDmfYzPftCSYFotm+Lx+inTGcpSh457xuEF+fq08RQi1ropFHgKBFj+21hu8Xkj
 qHfHCxIPIKDH2aZy9Vr8ZPHQAmTxtyapymT0VRrWyqYv6S8m3fbDq6igYT3+A8G1Gvtx
 mJe7ah8kRpM7GhlHm1zrM3qrMIkHNSv+sxx918zZDf0kPMvrq7LXj+ihj20L1Z+hDRJS
 UqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768170751; x=1768775551;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=968TPBV7ZHk1pT1hJPYejxTybirnqoIcqqfUXHVKDU8=;
 b=iO4C9THnxESc0635WD/mB6t05SEsfXghfC/T/+G33uTRzSCtx8TQG2WTjx9AE34XkI
 8JbWqZVa8wjrHmfWjHYMQsgGSJBKQzhU5g3oc8/aPSdC2v6c4oMdTj+SA+woZ4j7kfpN
 4avt/e/zjkAhPAyaqqS9oKv1vVklRmBIb6YSzT1WYaBbR53GbS4ssKUlvP6MwwOGfiWT
 jXcPVmEcQ1ECY5wEiOmdT3IDp7UTDmbibi8oneXW6WfhgCAEu81meE/fKkQGy26RouCY
 YJaphAYPDfYN05AOTT7nPKSJJJs1gSUpYne8oRddZeAyZWBv8b22fZaNCbAsbQVau8kI
 +gcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKq1L5bW4aaaUEsTlKF0XcUOkaALvic1dLkR8pdFHlh7Us4ewz4IUBxcwTr5nNAIbh+S4NAF7QrlQ=@nongnu.org
X-Gm-Message-State: AOJu0YxQ/Lim0By3T2usvT0CEZNt7V505ieLdnbRh/3U2OiiG2yOHXZq
 JVR/i+hXcHhbEC8BYZi8SFMS770lC79AG6lkzSTUpmD7g7e1ZCngTx9MGsUlx/IQPBU=
X-Gm-Gg: AY/fxX5G22DpN9BeQ3OlTlt/hYisjx5Ega6EY0yR1CnRyr9SWuH0NpXB85omooZ8NiZ
 qx2V4bM+e/FqgK2pyeWe3gfzmQ+aDCvjTxDR4IR7a29uS20Bnjj2tXTbT+eugjD9+P2JajiY5We
 6SjvFi/X5JqsYJiyiYlArURCbYuZgEt7y2hUWQUpeyhq2Mk+a/wkyP7BQQ1+gndBT48JjAtEUFQ
 VL832qpEa5keKNKfc+nXdMYG8fsJTbzzrHFuFZUKQTCu9DpY0WBymTUzaIYPQNILfYHrQxqBm6i
 A5olGUQphN/MsVMksAAGxUaVIgkKXTpi0QS0KEFseXD1SWVkGfTiX/TvtRN0AU+woFmiadbTn51
 He1P4lm5StdqxnlNR6nlYKCsSwGegirRppPzdCTJ2xNPHndjuScStsLPIJk98iEEmpUNc8q4WuR
 H7QN3q8oEKpDQOwIeu5H0FNbIM5A==
X-Google-Smtp-Source: AGHT+IFksuJSlQm2rVy4+P3EmyV8Grx1rpOCAEXimX+GByB9wUWv31eXhVPq70Qr8I3o1nA7/v/yNw==
X-Received: by 2002:a17:90a:da85:b0:343:60ab:ca8e with SMTP id
 98e67ed59e1d1-34f68c4d6e2mr16642060a91.17.1768170750729; 
 Sun, 11 Jan 2026 14:32:30 -0800 (PST)
Received: from [172.23.81.179] ([202.86.209.61])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c4cc8d292fcsm15496211a12.20.2026.01.11.14.32.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Jan 2026 14:32:30 -0800 (PST)
Message-ID: <1220fd98-8d11-4217-989d-b71bead76da2@linaro.org>
Date: Mon, 12 Jan 2026 09:32:21 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 23/24] util: add support for formatting thread info in
 messages
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 devel@lists.libvirt.org, qemu-block@nongnu.org, qemu-rust@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Kevin Wolf <kwolf@redhat.com>
References: <20260108170338.2693853-1-berrange@redhat.com>
 <20260108170338.2693853-24-berrange@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260108170338.2693853-24-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

On 1/9/26 04:03, Daniel P. Berrangé wrote:
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
> The '-msg thread-info=on|off' argument is introduced to allow this
> new default output to be supressed if desired.
> 
> Signed-off-by: Daniel P. Berrangé<berrange@redhat.com>
> ---
>   include/qemu/message.h               |  1 +
>   qemu-options.hx                      | 10 +++++++---
>   storage-daemon/qemu-storage-daemon.c |  6 ++++++
>   system/vl.c                          | 17 +++++++++++++++--
>   tests/qemu-iotests/041               |  2 +-
>   tests/qemu-iotests/common.filter     |  2 +-
>   util/message.c                       |  7 +++++++
>   7 files changed, 38 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

