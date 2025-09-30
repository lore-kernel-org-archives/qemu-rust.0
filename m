Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDD7CCA468
	for <qemu-rust@archiver.kernel.org>; Tue, 30 Sep 2025 15:00:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v3bpS-0004pP-Rg; Tue, 30 Sep 2025 10:59:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3bpR-0004og-5a
 for qemu-rust@nongnu.org; Tue, 30 Sep 2025 10:59:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3bpJ-0004p7-4Y
 for qemu-rust@nongnu.org; Tue, 30 Sep 2025 10:59:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759244369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=COvh3/RdYN3KGRtb7nDzXlzK/XoTNPRrpmHpM5JkCDs=;
 b=SgN8EPs9VHSBi+2syLBUDjX+LCsJFgvsT8B9U6hzPxcAT2oflZhykXFJFJbM3lWCSuZFyx
 ERpnG6xfLOBKva2BSWjwvc9ljajELS8Jj1xG8LE7gPlhWsyyukF0Wx1Ce8mDP6aBUTTAUe
 i42Ib0/wdKMVKVWd0sVso8OTGhxvIQI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-fYALV68DOfGt4opIZwQCow-1; Tue, 30 Sep 2025 10:59:28 -0400
X-MC-Unique: fYALV68DOfGt4opIZwQCow-1
X-Mimecast-MFC-AGG-ID: fYALV68DOfGt4opIZwQCow_1759244367
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-afcb72a8816so572361366b.0
 for <qemu-rust@nongnu.org>; Tue, 30 Sep 2025 07:59:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759244367; x=1759849167;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=COvh3/RdYN3KGRtb7nDzXlzK/XoTNPRrpmHpM5JkCDs=;
 b=LIj9MpwA3ViLuk9/uQgQtdyEgC8ObVSg418/YruCsF2zQhnB0SCWPPS7twNCjOfjqI
 xiR+q/ij/Jvgbh1358pkpUI0SwU4wT3Q+0pwSuT/qbtXlBNjb3tlY1YSrDGUngYMFIYO
 CsDbDWeAcTcYE/6s36W23qUWfdT22l2wI3///B0QcI4TnaGok70wyIVFwYrDOqDb7BHA
 IOlDx201FWKs4ZYjSuNPqzvbCPoo5fPYjEyavW9i8GTe1iLSW8DZAnebIbmP6DYi1hma
 TbOXv12n2ASj2S+a0dRym6lz/M2wNV9W0s1pNoM8XRJTEzIhPzDk0pDlM6/eBOHYzVhD
 ja0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/DlLAhzoKVLdYL+vxX2sKE/ksrvt6pJUkectQU+ynefXtvfvbgNrydgbqIEAJxlEprb+h9aXq4SI=@nongnu.org
X-Gm-Message-State: AOJu0YxLLPZafd83Vmx3hSY5heEdXvpIxFqouO34fznDFerS++IH5aez
 12153KKqunrHpxhJZuwegBwza3ykxfm92Jh/Ar6xwzKa06hefeyQuon6ERkpRFZfFzEhyff/tEe
 TuPfzVVG9S2ul0tlw0r0Rkxm3rL98ce6sepCRXEdbsijOVOatpd78OWg=
X-Gm-Gg: ASbGnctdCuhKiFyO5WnjuY9SqNr3F5l8tDF5z64jrgMYeUDTrBHw4AevkVvgNapdPvT
 5wg6m5uDaJsRuL+a1f6OH8+DD6oHAkcbZlt6SYxY7DTzFmJCRp8mrLA0HDsseLjFtJjY100SNHJ
 xRm3euPLbXCBkf8SSm6nHsIMNTVlzJuyacrEoO1R47mMoZ4PMtNZ+q3HCMsGWbPNxmDQ6iUaU3A
 rlmI8zBGhBbcX6mtjHlMtrMnm4Qe4lrHGo+kQSn7LHFD3wBgA5JyCgq5XTjSMf3VnewFawtHwkS
 HZIinrjODF0P87xwemPpFp1j8lB9aacMnkMou2coO2J8tCYXhlnMANkUt3xJTb1Nc/dRkeyuHfJ
 R9y5NJZ+1DSbWryp792WdwjvkWaRsW/xTmWQUbJPj2jaXACSKv3U=
X-Received: by 2002:a17:907:980b:b0:b40:6e13:1a7f with SMTP id
 a640c23a62f3a-b406e131b70mr727497066b.27.1759244366954; 
 Tue, 30 Sep 2025 07:59:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqH8Crt4pdWyr7i0JDz7DfER45AYlRhv0SX7Znh3FS/u+oMO2t3sMY5/1brsJTaGh6men2yw==
X-Received: by 2002:a17:907:980b:b0:b40:6e13:1a7f with SMTP id
 a640c23a62f3a-b406e131b70mr727490266b.27.1759244366167; 
 Tue, 30 Sep 2025 07:59:26 -0700 (PDT)
Received: from [192.168.10.81] ([176.206.127.188])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b40d70daf36sm296673166b.81.2025.09.30.07.59.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Sep 2025 07:59:25 -0700 (PDT)
Message-ID: <bc7c8163-4c6d-4690-a0f1-4e00b35a5ec0@redhat.com>
Date: Tue, 30 Sep 2025 16:59:24 +0200
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
X-Mimecast-MFC-PROC-ID: Tt7EDl1GEG1VaL0feOpMXy2eY_aZpydjOJY4J1hDvAc_1759244367
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Implement a bash version of rust-bindgen rust_to_clang_target() to
> convert from rust target to clang target.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

> ---
>   configure                            |  7 ++++
>   scripts/rust-to-clang-target-test.sh | 43 +++++++++++++++++++
>   scripts/rust-to-clang-target.sh      | 62 ++++++++++++++++++++++++++++
>   3 files changed, 112 insertions(+)
>   create mode 100755 scripts/rust-to-clang-target-test.sh
>   create mode 100644 scripts/rust-to-clang-target.sh
> 
> diff --git a/configure b/configure
> index 66613f3f4c..bf964947b8 100755
> --- a/configure
> +++ b/configure
> @@ -1878,6 +1878,13 @@ if test "$skip_meson" = no; then
>         eval "c=\$devices_${a}"
>         echo "${a}-softmmu = '$c'" >> $cross
>     done
> +  if test "$rust" != disabled; then
> +      if test "$cross_compile" = "yes"; then
> +          . "$source_path/scripts/rust-to-clang-target.sh"
> +          clang_target=$(rust_to_clang_target "$rust_target_triple")
> +          echo "bindgen_clang_arguments = [$(meson_quote --target="$clang_target")]" >> $cross
> +      fi
> +  fi
>   
>     echo "[built-in options]" >> $cross
>     echo "c_args = [$(meson_quote $CFLAGS $EXTRA_CFLAGS)]" >> $cross
> diff --git a/scripts/rust-to-clang-target-test.sh b/scripts/rust-to-clang-target-test.sh
> new file mode 100755
> index 0000000000..ff6f8fcdc5
> --- /dev/null
> +++ b/scripts/rust-to-clang-target-test.sh
> @@ -0,0 +1,43 @@
> +#!/usr/bin/env sh
> +#
> +# Copyright (C) 2025 Red Hat, Inc.
> +#
> +# Based on rust_to_clang_target() tests from rust-bindgen.
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +scripts_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
> +. "$scripts_dir/rust-to-clang-target.sh"
> +
> +test_case() {
> +    input="$1"
> +    expected="$2"
> +    result=$(rust_to_clang_target "$input")
> +
> +    if [ "$result" = "$expected" ]; then
> +        echo " OK: '$input' -> '$result'"
> +    else
> +        echo " FAILED: '$input'"
> +        echo "  Expected: '$expected'"
> +        echo "  Got:      '$result'"
> +        exit 1
> +    fi
> +}
> +
> +echo "Running tests..."
> +
> +test_case "aarch64-apple-ios" "arm64-apple-ios"
> +test_case "riscv64gc-unknown-linux-gnu" "riscv64-unknown-linux-gnu"
> +test_case "riscv64imac-unknown-none-elf" "riscv64-unknown-none-elf"
> +test_case "riscv32imc-unknown-none-elf" "riscv32-unknown-none-elf"
> +test_case "riscv32imac-unknown-none-elf" "riscv32-unknown-none-elf"
> +test_case "riscv32imafc-unknown-none-elf" "riscv32-unknown-none-elf"
> +test_case "riscv32i-unknown-none-elf" "riscv32-unknown-none-elf"
> +test_case "riscv32imc-esp-espidf" "riscv32-esp-elf"
> +test_case "xtensa-esp32-espidf" "xtensa-esp32-elf"
> +test_case "aarch64-apple-ios-sim" "arm64-apple-ios-simulator"
> +test_case "aarch64-apple-tvos-sim" "arm64-apple-tvos-simulator"
> +test_case "aarch64-apple-watchos-sim" "arm64-apple-watchos-simulator"
> +
> +echo ""
> +echo "All tests passed!"
> diff --git a/scripts/rust-to-clang-target.sh b/scripts/rust-to-clang-target.sh
> new file mode 100644
> index 0000000000..5451807888
> --- /dev/null
> +++ b/scripts/rust-to-clang-target.sh
> @@ -0,0 +1,62 @@
> +#!/usr/bin/env sh
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


