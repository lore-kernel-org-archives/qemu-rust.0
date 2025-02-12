Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ti7RR-0000zq-O3
	for mharc-qemu-rust@gnu.org; Wed, 12 Feb 2025 02:45:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ti7RO-0000yo-Nl
 for qemu-rust@nongnu.org; Wed, 12 Feb 2025 02:45:51 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ti7RM-0008N0-7X
 for qemu-rust@nongnu.org; Wed, 12 Feb 2025 02:45:50 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-38dd91c313bso1941829f8f.3
 for <qemu-rust@nongnu.org>; Tue, 11 Feb 2025 23:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739346346; x=1739951146; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Qm1f1nZfZ2iQKvWN53yOji6gIYUo6lA0Co9Noz/ZQ8A=;
 b=dDKq6qSXhdTyM3uAkPfUoLunyg0LsBLB8+IqYkqR5Wpmq5r8u5fIBjVKWxaDd8vmL1
 PQAShf8FXc270Gzc4r5zMlzfv7Ouwd/8QrQQW973dzQetDRVBQdV144QcZEYU2NT3Wqe
 sMv5o09J8C5DlKiMwmYJc3Q9tmDA3Pr3cmw7yhom+AsXqUrHwiqAmjNWtUb7tGz4fvzu
 tMQF+y1MtgphtuhwJVDbHjRdnDuqbaipVnv1AQ49UOQUJgTKjdr5Z1ByR0j6XkbvMK1n
 hxRId5IoaCaA3xYxNHlCK4uWS8eQwt1+puFm2ZYowu4kM/6HOKriKFiqleNtKFleFk84
 8mtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739346346; x=1739951146;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qm1f1nZfZ2iQKvWN53yOji6gIYUo6lA0Co9Noz/ZQ8A=;
 b=olXCLPgMLiAtu37VBjrAbXITG3G17koGqN8Ggf4mRn3vw4pt6ZGSSc9wtjU5lFor1i
 e5+RfraY3e6bx0g9/1IYW18VVLB+U+JkfEQK7nCO+qDCbxRaBfTjleiOnNtqLcaQJ/I8
 cMu5xu2I38PctTOOHiin/3a4oAR5H0vVTFJuqFne9TuMq96yvDDvJF5dcG+4SjzoksEv
 CC0wEPp09kvPTG0tGzShPKkgLNXKx/+G+7RlXYhKQRJrueFW9CxgbfLoRr3jUhrvlNlY
 PJWu9iY4KnLn6mRPAX/6nH7jdlt2EalvIR9py8YBc0kG4V97PH8cTxaGo3yBGCRonXMB
 ja9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxNiI6MIicDaUqILlgaw9Wmv8wb4miio+XJvCz6u5Hs9nInDb9EzkVRzBFOy5wHsSnhi/2ZqIpGGQ=@nongnu.org
X-Gm-Message-State: AOJu0YzQdWOiLmf4dsYKaHpB+3sZFLV91nW659x2kJWKN6zHz0nixFJt
 EhRdNwBKXqJPKZRmgCPc3Xsu+kNZXbcOYmPpAYi57tE8HSGQCs0Sgq9DjYxTOPE=
X-Gm-Gg: ASbGnct2s1yuiMxoPJHnph0Q82UJKMzBoiBY4xLoRmL+YAFKxpyNZuPmRChyFBGjLfY
 2rnFMw0ui+PDI81Ujx/Srexp12FcyOMsTayC/4AR+6xDcn5bEHikLfUYvHJ5dJwhRldtLXNNw1a
 OIsFeAw10PEs5QPlRc/Axtof9dV65McV+2WvugQp9+xJvpdgp+d214Fxq0ug3BWVDWmY/p342W8
 boP6pQQQtatcV2Aok4bVXRaw302ahiEOMcGiMbNkwjkgW6nd3lnSyPppHn9KBck3dwZO2KpREEF
 6NdfXvQ3/zmT1OWeRDkl6s/6A//wvowQAFfQS+KD4+2r0WihH1xZvUxPPQo=
X-Google-Smtp-Source: AGHT+IE8s+zZzR1HelEYIDX5pkqVkyf5pB5dJZ6r8qkUm7bHnjSddHuIDywXanjr3eSTaPAopbCukQ==
X-Received: by 2002:a5d:6702:0:b0:38c:5ba4:48a3 with SMTP id
 ffacd0b85a97d-38dea60469cmr1166941f8f.46.1739346346201; 
 Tue, 11 Feb 2025 23:45:46 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a04cdafsm11852495e9.4.2025.02.11.23.45.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 23:45:45 -0800 (PST)
Message-ID: <0e3d0835-c216-4f8c-8b97-e849ecb5ca47@linaro.org>
Date: Wed, 12 Feb 2025 08:45:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] bochs-rs: Add bochs block driver reimplementation
 in Rust
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: hreitz@redhat.com, pbonzini@redhat.com, manos.pitsidianakis@linaro.org,
 qemu-devel@nongnu.org, qemu-rust@nongnu.org
References: <20250211214328.640374-1-kwolf@redhat.com>
 <20250211214328.640374-11-kwolf@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250211214328.640374-11-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
X-List-Received-Date: Wed, 12 Feb 2025 07:45:51 -0000

On 11/2/25 22:43, Kevin Wolf wrote:
> This adds a separate block driver for the bochs image format called
> 'bochs-rs' so that for the moment both the C implementation and the Rust
> implementation can be present in the same build. The intention is to
> remove the C implementation eventually and rename this one into 'bochs'.
> This can only happen once Rust can be a hard build dependency for QEMU.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   rust/block/Cargo.toml    |   2 +-
>   rust/block/src/bochs.rs  | 296 +++++++++++++++++++++++++++++++++++++++
>   rust/block/src/driver.rs |   5 -
>   rust/block/src/lib.rs    |   1 +
>   4 files changed, 298 insertions(+), 6 deletions(-)
>   create mode 100644 rust/block/src/bochs.rs


> diff --git a/rust/block/src/bochs.rs b/rust/block/src/bochs.rs
> new file mode 100644
> index 0000000000..388ac5ef03
> --- /dev/null
> +++ b/rust/block/src/bochs.rs
> @@ -0,0 +1,296 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Block driver for the various disk image formats used by Bochs
> + * Currently only for "growing" type in read-only mode
> + *
> + * Copyright (c) 2005 Alex Beregszaszi
> + * Copyright (c) 2024 Red Hat
> + *
> + * Authors:
> + *   Alex Beregszaszi
> + *   Kevin Wolf <kwolf@redhat.com>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */

As an addition, we don't have to add the full license boilerplate IMO...


