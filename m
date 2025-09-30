Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C89ACAC5B8
	for <qemu-rust@archiver.kernel.org>; Tue, 30 Sep 2025 09:09:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v3WMJ-0001Ab-D1; Tue, 30 Sep 2025 05:09:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3WME-00017o-4m
 for qemu-rust@nongnu.org; Tue, 30 Sep 2025 05:09:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3WM1-0005Ua-UJ
 for qemu-rust@nongnu.org; Tue, 30 Sep 2025 05:09:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759223338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=NKuz4UKGBcCzd1DI7u8qbWOkt85Hacv7nW6LL4I1yeU=;
 b=aLCPsDLakuk05pIdRaOEquUDnaa0kFPE5oSin749RJyCSp2vaNQbDUm2aaOofNChvGBZgA
 wox8i+TC6SEcjXTmXQOakbP4QsHB7LA/kScIL+rRnNg4SBCRj01TOELNjanPExY4RlfExn
 /VxaRPrqHT7qkftIDeNsydeeeXBN5KY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-9JqBNtoyOXyT-5UJaST48w-1; Tue, 30 Sep 2025 05:08:56 -0400
X-MC-Unique: 9JqBNtoyOXyT-5UJaST48w-1
X-Mimecast-MFC-AGG-ID: 9JqBNtoyOXyT-5UJaST48w_1759223335
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-634ae21c4cdso7672312a12.3
 for <qemu-rust@nongnu.org>; Tue, 30 Sep 2025 02:08:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759223332; x=1759828132;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NKuz4UKGBcCzd1DI7u8qbWOkt85Hacv7nW6LL4I1yeU=;
 b=aa4sZhC5UAmLidrTPhWENPCL6JYfkpDBLv2JSzwXDU0vX3jqXytJih686PtFiG9fP3
 LGmMUbkQZryMd4SPOWkaQUMbrjy7ULlSpmKhsW0/54db8d58HyP4N9atfnBv0mCEgNUQ
 QEycmkE2KVfiyeVBXO62pPwd+p7O8eHzMLon/lU6om/NwiGN7O9GnfKWzJjR4TYB49CY
 4xHOljOc25ThoHbr44EIO7+hlTO/vH69b6kHOo3pg09ko2nYOLItPv6qq25DSliTY8LE
 OzLJ7wq5HOIrGBdHjNdTWFnuhvLQ2i4COdUVoGIRmWtTGyhUSGyhegFMZO9pAIxqU/R3
 4ZNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6kKwdjaGe+d4ijPSCRhrKCO16VXP0I+FWcvky2PPEsfwAq42NYesUkRoMr5RTyWrm8xvQKLQ/KQs=@nongnu.org
X-Gm-Message-State: AOJu0YwNwWcZefjZmW75IWlj+9ADl8B3BneTIeCqoVdkfcZIU/m6EIEf
 /mpDSIlsJotfp0wOygW36DVbAEfKnYLUUvVFqaFNR3KnsYT8QzYTJyjIjmfqvvsXhocrxzCSmOT
 Ajt3TnXGXLHVdXtmcI+vfLMsrvWzJRmLu03zGjXjXCEWp5JRJzNT+hBo=
X-Gm-Gg: ASbGncuGk845Ewv5sgKpmsKbo9LziVFBO+xYqSObOfmHQkMXx94wMTeF1K6mXPFCf6U
 buWwlmgmyze9Nnej862MVAKcl6Jgucsg05SDgbUDGuA8Ldgrp84kKVRSC4VS1MtHRaGwbJygRJ4
 ZtIAIV8ekJ40q+DCg2eSYC/E4fM1nxJdx+Kv691v2MV/dr7ntbbEcqIKcDUwJru+OsAb3xxDL1x
 pPO5lPTou/FEDB5ujnDzrTINmxDKMlNTSo0SxYsx78YhEHBaffZ2vP762Dh6D0CXa7QYtvv2i1W
 /gHbkq8sG0xkKlzKzTpYq+Z4LJK73b/UlLQAcD8Ab+u+5xZz1ITrxsl1A8XE05ixzJPhtI8mq1c
 MQ+Ao2oNwiJ6f1rfA+bWVIBYHcdO/cvZwIiVrZDjfbvmCqWXg9I8=
X-Received: by 2002:a17:906:f049:b0:b40:b6a9:f70f with SMTP id
 a640c23a62f3a-b40b6a9fbe9mr497972466b.4.1759223332255; 
 Tue, 30 Sep 2025 02:08:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMrFoqDwkjXvmboK7U3vnQXcDXK9C01Yog21Anqh/GjDLDEs26gZmEuN9gVA/ja089z6xcXg==
X-Received: by 2002:a17:906:f049:b0:b40:b6a9:f70f with SMTP id
 a640c23a62f3a-b40b6a9fbe9mr497968966b.4.1759223331760; 
 Tue, 30 Sep 2025 02:08:51 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.127.188])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b3eb0db0b92sm383395666b.23.2025.09.30.02.08.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Sep 2025 02:08:51 -0700 (PDT)
Message-ID: <dd4bc8b8-b50e-4613-b083-73918623c036@redhat.com>
Date: Tue, 30 Sep 2025 11:08:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/27] CI/build-sys fixes to enable Rust more widely
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Warner Losh <imp@bsdimp.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ed Maste <emaste@freebsd.org>,
 devel@lists.libvirt.org, qemu-rust@nongnu.org,
 Kohei Tokunaga <ktokunaga.mail@gmail.com>
References: <20250924120426.2158655-1-marcandre.lureau@redhat.com>
 <87y0pzg6gt.fsf@draig.linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <87y0pzg6gt.fsf@draig.linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oGa0wrY56SW9SvKPUkPpj5wDbYGniYofaYv-MQXiNCw_1759223335
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.513,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 9/27/25 19:17, Alex Bennée wrote:
> marcandre.lureau@redhat.com writes:
> 
>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>
>> Hi,
>>
>> This patch series fixes a number of issues with the build system and CI and
>> enable Rust for many of our jobs, getting us closer to enable Rust by default.
>>
>> emscripten is difficult to enable, help welcome.
> 
> Also I think:
> 
>    https://gitlab.com/stsquad/qemu/-/pipelines/2065603411
> 
> And the:
>    debian-armhf-cross
>    debian-i686-cross
>    debian-mipsel-cross
>    debian-mips64el-cross
>    debian-ppc64el-cross
>    debian-riscv64-cross

I'll test 1-21+26 and see what breaks with that subset.

Paolo

> 
> cross builds fail.
> 
>>
>> v2:
>> - add a rust-to-clang-target-test.sh configure script
>> - drop "RFC: configure: use the same machine as the host triple"
>> - replace "tests: move mips to debian-legacy-test-cross" with "RFC: build-sys: deprecate mips host"
>> - start tackling emscripten
>> - fix mis-placed submodule update
>> - other minor changes, commit message tweaks, bz links
>> - add r-b tags
>>
>> Marc-André Lureau (27):
>>    build-sys: require -lrt when no shm_open() in std libs
>>    gitlab-ci: fix 'needs' property type must be array
>>    scripts/archive-source: speed up downloading subprojects
>>    scripts/archive-source: silence subprojects downloads
>>    scripts/archive-source: use a bash array
>>    configure: fix rust meson configuration
>>    configure: set the bindgen cross target
>>    tests/docker/common: print errors to stderr
>>    tests/docker: use fully qualified image name for emsdk
>>    tests/docker/common: print meson log on configure failure
>>    build-sys: cfi_debug and safe_stack are not compatible
>>    lcitool: update, switch to f41
>>    lcitool/qemu: include libclang-rt for TSAN
>>    lcitool/alpine: workaround bindgen issue
>>    tests/lcitool: add missing rust-std dep
>>    tests/lcitool: update to debian13
>>    tests/docker: add ENABLE_RUST environment
>>    tests/lcitool: enable rust & refresh
>>    configure: set the meson executable suffix/ext
>>    tests/freebsd: enable Rust
>>    meson: rust-bindgen limit allowlist-file to srcdir/include
>>    RFC: tests/docker: add rust to debian-legacy-test-cross
>>    WIP: gitlab-ci: enable rust for msys2-64bit
>>    WIP: cirrus/macos: enable Rust
>>    RFC: build-sys: deprecate mips host
>>    build-sys: pass -fvisibility=default for wasm bindgen
>>    WIP: enable rust for wasm/emscripten
>>
>>   docs/about/build-platforms.rst                |  2 -
>>   docs/about/deprecated.rst                     |  9 +--
>>   configure                                     | 27 +++++++-
>>   meson.build                                   | 34 +++++++---
>>   .gitlab-ci.d/buildtest-template.yml           |  2 +-
>>   .gitlab-ci.d/buildtest.yml                    | 66 +++++++++----------
>>   .gitlab-ci.d/cirrus.yml                       |  4 +-
>>   .gitlab-ci.d/crossbuilds.yml                  | 46 ++++++-------
>>   .gitlab-ci.d/static_checks.yml                |  6 +-
>>   .gitlab-ci.d/windows.yml                      |  8 ++-
>>   rust/bql/meson.build                          |  1 +
>>   rust/chardev/meson.build                      |  1 +
>>   rust/hw/char/pl011/meson.build                |  1 +
>>   rust/hw/core/meson.build                      |  1 +
>>   rust/migration/meson.build                    |  3 +-
>>   rust/qom/meson.build                          |  1 +
>>   rust/system/meson.build                       |  1 +
>>   rust/util/meson.build                         |  1 +
>>   scripts/archive-source.sh                     | 33 +++++++---
>>   .../ci/setup/ubuntu/ubuntu-2204-aarch64.yaml  |  5 +-
>>   .../ci/setup/ubuntu/ubuntu-2204-s390x.yaml    |  5 +-
>>   scripts/rust-to-clang-target-test.sh          | 43 ++++++++++++
>>   scripts/rust-to-clang-target.sh               | 62 +++++++++++++++++
>>   tests/docker/common.rc                        | 11 +++-
>>   tests/docker/dockerfiles/alpine.docker        |  6 +-
>>   tests/docker/dockerfiles/centos9.docker       |  4 ++
>>   .../dockerfiles/debian-amd64-cross.docker     | 18 +++--
>>   .../dockerfiles/debian-arm64-cross.docker     | 18 +++--
>>   .../dockerfiles/debian-armhf-cross.docker     | 21 +++---
>>   .../dockerfiles/debian-i686-cross.docker      | 20 ++++--
>>   .../debian-legacy-test-cross.docker           |  9 ++-
>>   .../dockerfiles/debian-mips64el-cross.docker  |  9 ++-
>>   .../dockerfiles/debian-mipsel-cross.docker    |  9 ++-
>>   .../dockerfiles/debian-ppc64el-cross.docker   | 18 +++--
>>   .../dockerfiles/debian-riscv64-cross.docker   | 10 ++-
>>   .../dockerfiles/debian-s390x-cross.docker     | 18 +++--
>>   tests/docker/dockerfiles/debian.docker        | 18 +++--
>>   .../dockerfiles/emsdk-wasm32-cross.docker     | 29 +++++++-
>>   .../dockerfiles/fedora-rust-nightly.docker    | 18 +++--
>>   .../dockerfiles/fedora-win64-cross.docker     | 15 +++--
>>   tests/docker/dockerfiles/fedora.docker        | 18 +++--
>>   tests/docker/dockerfiles/opensuse-leap.docker |  7 +-
>>   tests/docker/dockerfiles/ubuntu2204.docker    |  7 +-
>>   tests/docker/test-wasm                        | 12 ++++
>>   tests/lcitool/libvirt-ci                      |  2 +-
>>   tests/lcitool/projects/qemu.yml               |  3 +-
>>   tests/lcitool/refresh                         | 48 +++++++++-----
>>   tests/vm/freebsd                              |  4 +-
>>   48 files changed, 531 insertions(+), 183 deletions(-)
>>   create mode 100755 scripts/rust-to-clang-target-test.sh
>>   create mode 100644 scripts/rust-to-clang-target.sh
>>   create mode 100755 tests/docker/test-wasm
> 


