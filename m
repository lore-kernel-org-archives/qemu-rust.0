Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AF6CCA470
	for <qemu-rust@archiver.kernel.org>; Tue, 30 Sep 2025 14:58:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v3boB-0004WG-OF; Tue, 30 Sep 2025 10:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3bo5-0004VF-JQ
 for qemu-rust@nongnu.org; Tue, 30 Sep 2025 10:58:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3bnz-0004WQ-Ar
 for qemu-rust@nongnu.org; Tue, 30 Sep 2025 10:58:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759244290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=FZs0h6AYVzq9vcCTOk5dqb/669DE7XtOFxnqYTO6g4Y=;
 b=GQjDGv2CIxQbShKomw1hXLNeI5IGpA+4S0X3axe9gjfiip0WzxfA8V4samrnaeOXHC8i3N
 UbxUyrnIl4TCgSIuKi+yuZrjOs9cD8MYoNRAAWmm9kCBS9fEVa242ALE/CSGp9eyl7a/Dz
 KYvCVlbGa0pb14tQ2ZDb40+sc/e9rEQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-bm9uc7cyP8arE-1yM26vXA-1; Tue, 30 Sep 2025 10:58:08 -0400
X-MC-Unique: bm9uc7cyP8arE-1yM26vXA-1
X-Mimecast-MFC-AGG-ID: bm9uc7cyP8arE-1yM26vXA_1759244287
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-b2f9dc3264bso808253366b.1
 for <qemu-rust@nongnu.org>; Tue, 30 Sep 2025 07:58:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759244287; x=1759849087;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FZs0h6AYVzq9vcCTOk5dqb/669DE7XtOFxnqYTO6g4Y=;
 b=EOTqaN/eHjxM8GgWuIvpwePRpJugVMmZod/9T1HCg3fXDiubY/pGmCoQxe/X4TfLl6
 NT0psoSub5nOzlZE4n5HzsZLAfcBsFiWc8dQTmjk4k/MQ8dZ7v0EsoKkU7aJbZNj83HN
 SsYLxUgxQoifBYOnoSmcKJsiNRvzFUuOwsqAejMajzSaHMrjhpsOKw5N8MuOTceeYs0u
 tp7QeVkQTeFpmKip4XQZP/OQztbEiyAV8Z00M1uW4lVzI2eAIlqN6FlCB5H8/eTntp72
 hTDiVUfFl8dnJ1Y2agRwo2IOF3AhXtAEOCUqZkNGhZI6G2ZV47XmM1y1JR2FZHHGZyci
 iE2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWS7z/QGnXPS6nw5rYqqfruhgsd15bJmRgeqFZX7RVYe7CdA6JDl7070f3KXB+hvuG+jsFtCHFICIk=@nongnu.org
X-Gm-Message-State: AOJu0YwSHg9wMyAfyjUYpLpePZxyD53znStBwWaU1NSV4MJOTU8exHTE
 eir2/nMw2daB5X5QiEDu8uVqT799yHRR+kmPWbC3YQlkCtq2DvjvAReUN9f/6yRQJVW5pLxYvnX
 40uY6vDhYD6V4CiM3CR3hfFdUkua2224l5a+tQH5OAXBFn1dHMHVdPlw=
X-Gm-Gg: ASbGncuU2UnQEe2sTcNPQyMg+ULGooUElcE66rZOzkGDcWh9DGJ6WSHDR8Fe97zUitT
 vc8o6LLnKGOLQUBooaSRadI3X3zfOAJlUcLLyVnAuHjqglf37u+o7GtbXV03SnYuS3g9k/6ttp9
 swmypBwHVYXc2evAna5s1VkVX8Bkl+48HLS0bxecImmwLzKrK7hdIqefzP4gPuPAC2ibhXawfP/
 ky7LbLgqSWz9g+e41hJyW3wxXc3U/yXrK/AtqvIED+HWRjGWBNhT4nO7/3w2lOv4sNJQbmV3F9V
 rH+tYt5vw+kgzQWL4H9ZOJ7nGkPQtrlSzbrKuSxbK0APSIYYBMndGJLIPD0jAVWuJVUkDhe55rL
 bsUrOuZ/HUA9kV+VMnnKOtG6Jyam1nEO/nE7yQnqX64FhaPNFs+M=
X-Received: by 2002:a17:907:702:b0:b04:7107:9758 with SMTP id
 a640c23a62f3a-b34baf43b3amr2210652366b.43.1759244287485; 
 Tue, 30 Sep 2025 07:58:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUGMIpnIK44bbWU7+aXndC+moPoC+0yLIifvUBARDStwQ2sbA17FTE0A5aMsenHTTiCZBueg==
X-Received: by 2002:a17:907:702:b0:b04:7107:9758 with SMTP id
 a640c23a62f3a-b34baf43b3amr2210650066b.43.1759244287083; 
 Tue, 30 Sep 2025 07:58:07 -0700 (PDT)
Received: from [192.168.10.81] ([176.206.127.188])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b3bc5761d3dsm647453966b.19.2025.09.30.07.58.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Sep 2025 07:58:06 -0700 (PDT)
Message-ID: <48454dc0-7047-4208-9a60-d25dad5aff35@redhat.com>
Date: Tue, 30 Sep 2025 16:58:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/27] configure: set the bindgen cross target
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Yonggang Luo <luoyonggang@gmail.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Warner Losh <imp@bsdimp.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ed Maste <emaste@freebsd.org>,
 devel@lists.libvirt.org, qemu-rust@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kohei Tokunaga <ktokunaga.mail@gmail.com>
References: <20250924120426.2158655-1-marcandre.lureau@redhat.com>
 <20250924120426.2158655-8-marcandre.lureau@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20250924120426.2158655-8-marcandre.lureau@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EKbau-3lwkPVf8AGWtKg5n_TTsiVPe1eNf_xfSDRW48_1759244287
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 9/24/25 14:04, marcandre.lureau@redhat.com wrote:
> diff --git a/scripts/rust-to-clang-target.sh b/scripts/rust-to-clang-target.sh
> new file mode 100644
> index 0000000000..5451807888
> --- /dev/null
> +++ b/scripts/rust-to-clang-target.sh
> @@ -0,0 +1,62 @@
> +#!/usr/bin/env sh

No shebang is needed, since the file is sourced into the configure script.

Otherwise,

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

> +#
> +# Copyright (C) 2025 Red Hat, Inc.
> +#
> +# Based on rust_to_clang_target() from rust-bindgen.
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +rust_to_clang_target() {
> +    rust_target="$1"
> +
> +    # Split the string by hyphens
> +    triple_parts=""
> +    old_IFS="$IFS"
> +    IFS='-'
> +    for part in $rust_target; do
> +        triple_parts="$triple_parts $part"
> +    done
> +    IFS="$old_IFS"
> +    set -- $triple_parts
> +
> +    # RISC-V
> +    case "$1" in
> +        riscv32*)
> +            set -- "riscv32" "${2}" "${3}" "${4}"
> +            ;;
> +        riscv64*)
> +            set -- "riscv64" "${2}" "${3}" "${4}"
> +            ;;
> +    esac
> +
> +    # Apple
> +    if [ "$2" = "apple" ]; then
> +        if [ "$1" = "aarch64" ]; then
> +            set -- "arm64" "${2}" "${3}" "${4}"
> +        fi
> +        if [ "$4" = "sim" ]; then
> +            set -- "${1}" "${2}" "${3}" "simulator"
> +        fi
> +    fi
> +
> +    # ESP-IDF
> +    if [ "$3" = "espidf" ]; then
> +        set -- "${1}" "${2}" "elf" "${4}"
> +    fi
> +
> +    # Reassemble the string
> +    new_triple=""
> +    first=1
> +    for part in "$@"; do
> +        if [ -n "$part" ]; then
> +            if [ "$first" -eq 1 ]; then
> +                new_triple="$part"
> +                first=0
> +            else
> +                new_triple="$new_triple-$part"
> +            fi
> +        fi
> +    done
> +
> +    echo "$new_triple"
> +}


