Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uAqFf-0003iy-3L
	for mharc-qemu-rust@gnu.org; Fri, 02 May 2025 09:16:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uAoKi-0003JO-GH
 for qemu-rust@nongnu.org; Fri, 02 May 2025 07:13:32 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uAoKg-0005SR-03
 for qemu-rust@nongnu.org; Fri, 02 May 2025 07:13:32 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43ede096d73so11217585e9.2
 for <qemu-rust@nongnu.org>; Fri, 02 May 2025 04:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746184408; x=1746789208; darn=nongnu.org;
 h=mime-version:message-id:in-reply-to:references:user-agent:subject
 :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vCSzSM8DVg7QoR9d8k2QuiqD9XO+t9hB/HzFzaCSTC4=;
 b=iu2XedDtOTDlNhv/GWAgXbLYwaJWBFWqz93WqfQ42PS9sVC926b5Ml/E/Pv6vHtmEO
 tuSuZ8tCEnzkn4MkMT5D3NWANNh3kDRnGj8nszJvMdcRqme5vtLq8Plr3P8vafhJ7A/a
 1sp9p4BQS8lhpwCjM7TrWsIc8DZcAXEOEWzJlmBzi1Eawm3CkOymy6gvaq85GoiZwf3R
 r1Xpr9EJ4yma7uUm5oUZtRmZd1H2RhKqhTQoT7MvkAck1jdFUaFO2sbHsrvy2XoKY6fB
 IWs3rPJMk7607FNY1xnCGK5iwH/k+rewdsb5DXxt8YHIEj0j6FWC+Iu/zWgizLuwHqzn
 A+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746184408; x=1746789208;
 h=mime-version:message-id:in-reply-to:references:user-agent:subject
 :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vCSzSM8DVg7QoR9d8k2QuiqD9XO+t9hB/HzFzaCSTC4=;
 b=kBX4dfVwqQRt28ZETzU/9ZWWkawhvannLc444UEOMMjZmC82O+Qn7hnyBO9z3NfADS
 PrrlZkNuLUYGmSXtVh6psT2dvx/4Ibs8Cjb/sY5/yJGsRmwS1aUbCKiHCOOAIQIHT9ZK
 1QYQ01/RTGLFr94TqfzMydAtyjfsaJp9Tsxs6guoQywh5wbXI/QvUmgvUWomb2j5gTs3
 jVqo8JUo4Mt2m2phRM5q44aVeEuiXADQgRfVEYO7bF1spW8ZROyPiU44tQZCSjHvh8I4
 JQVc5vIKBN6Dz25crZVel2actA5kgRLp5MyIOiwPg0UTXFiH5EMrKPUzUPVXJkg1yi0g
 aZ4Q==
X-Gm-Message-State: AOJu0Yyh9IXFsMyjXVyDCuVx/Q7Wu0w+sa2sMMFlzkHKvRKfpxnKKaDG
 Fj3tl8S9H0liCwS/yGizCIc3f5Qggpb3sS8ekKOdoRBOxhd1oFmdACXgUumzxmSZUp1THTA6ir4
 kack=
X-Gm-Gg: ASbGncsfguqTeOhbEMfzd16JPKjottP7vgcCM5soSgrJsrehJ8Oq8z0H9YzQ8cp2ckn
 ccta+KYUfU6yXWRq88F/whH0MWeguRPcEHrrrbsMnGT3bRvRlTQ2UVJYKj01PAKdjCjAa+/b6GF
 UTJaxGLSNatPdDJFfX13nsiIAnjN8o3yoIYe0SGfEkJnXikTTFROid4Nmzj7hVpP93y9xFZMC/s
 QaBO8aIg5Mi6lSTYxFHktVlyEcHp+uloZvGnAdzsHCSZkF6Qu9V9qQ4rMgmQuDzIasUY9MsB2rI
 xXZQZdRMmK6d9+ytP+vgb7Fxd37tab5RoFN/+TovonxoAlqIJhXaFGPY9ifGCXXzHgbOIYQUQG2
 eDZatCA==
X-Google-Smtp-Source: AGHT+IEtY9ApAwYjqJsfX/M+WyF2XjM33ktO4Ztx6xi9paV5/dinGzPv6ajf9gPE9zPfApUJImhDZg==
X-Received: by 2002:a05:600c:a40a:b0:43d:ed:acd5 with SMTP id
 5b1f17b1804b1-441c0453151mr4493005e9.10.1746184408000; 
 Fri, 02 May 2025 04:13:28 -0700 (PDT)
Received: from meli-email.org (adsl-37.37.6.161.tellas.gr. [37.6.161.37])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b89ee171sm41109015e9.17.2025.05.02.04.13.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 04:13:27 -0700 (PDT)
Date: Fri, 02 May 2025 14:09:10 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-rust@nongnu.org
Bcc: 
Subject: Re: [PATCH 8/9] rust: enable clippy::ptr_cast_constness
User-Agent: meli/0.8.12
References: <20250502102323.104815-1-pbonzini@redhat.com>
 <20250502102323.104815-9-pbonzini@redhat.com>
In-Reply-To: <20250502102323.104815-9-pbonzini@redhat.com>
Message-ID: <svmsie.1mbmcen6stmg8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 02 May 2025 09:16:24 -0400
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
X-List-Received-Date: Fri, 02 May 2025 11:13:33 -0000

On Fri, 02 May 2025 13:23, Paolo Bonzini <pbonzini@redhat.com> wrote:
>Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>---
> docs/devel/rust.rst             | 2 --
> rust/Cargo.toml                 | 2 +-
> rust/clippy.toml                | 2 +-
> rust/hw/char/pl011/Cargo.toml   | 2 +-
> rust/hw/timer/hpet/Cargo.toml   | 2 +-
> rust/hw/timer/hpet/src/hpet.rs  | 2 +-
> rust/qemu-api-macros/Cargo.toml | 2 +-
> rust/qemu-api/Cargo.toml        | 2 +-
> rust/qemu-api/src/cell.rs       | 2 +-
> rust/qemu-api/src/chardev.rs    | 2 +-
> rust/qemu-api/src/qom.rs        | 4 ++--
> rust/qemu-api/src/timer.rs      | 2 +-
> 12 files changed, 12 insertions(+), 14 deletions(-)
>

These:

>diff --git a/rust/clippy.toml b/rust/clippy.toml
>index 5d190f91dec..933e46a2ffb 100644
>--- a/rust/clippy.toml
>+++ b/rust/clippy.toml
>@@ -1,2 +1,2 @@
> doc-valid-idents = ["PrimeCell", ".."]
>-msrv = "1.63.0"
>+msrv = "1.77.0"

>diff --git a/rust/hw/char/pl011/Cargo.toml b/rust/hw/char/pl011/Cargo.toml
>index f2296cad58b..4766badd73e 100644
>--- a/rust/hw/char/pl011/Cargo.toml
>+++ b/rust/hw/char/pl011/Cargo.toml
>@@ -9,7 +9,7 @@ resolver = "2"
> publish = false
> keywords = []
> categories = []
>-rust-version = "1.63.0"
>+rust-version = "1.77.0"
> 
> [lib]
> crate-type = ["staticlib"]

>diff --git a/rust/hw/timer/hpet/Cargo.toml b/rust/hw/timer/hpet/Cargo.toml
>index 147f216e725..c6c48b2f887 100644
>--- a/rust/hw/timer/hpet/Cargo.toml
>+++ b/rust/hw/timer/hpet/Cargo.toml
>@@ -5,7 +5,7 @@ edition = "2021"
> authors = ["Zhao Liu <zhao1.liu@intel.com>"]
> license = "GPL-2.0-or-later"
> description = "IA-PC High Precision Event Timer emulation in Rust"
>-rust-version = "1.63.0"
>+rust-version = "1.77.0"
> 
> [lib]
> crate-type = ["staticlib"]

>diff --git a/rust/qemu-api-macros/Cargo.toml 
>b/rust/qemu-api-macros/Cargo.toml
>index 89dee1cfb39..8344b1f939d 100644
>--- a/rust/qemu-api-macros/Cargo.toml
>+++ b/rust/qemu-api-macros/Cargo.toml
>@@ -9,7 +9,7 @@ resolver = "2"
> publish = false
> keywords = []
> categories = []
>-rust-version = "1.63.0"
>+rust-version = "1.77.0"
> 
> [lib]
> proc-macro = true
>diff --git a/rust/qemu-api/Cargo.toml b/rust/qemu-api/Cargo.toml
>index c5b7b2464e9..be00ef1ae9b 100644
>--- a/rust/qemu-api/Cargo.toml
>+++ b/rust/qemu-api/Cargo.toml
>@@ -12,7 +12,7 @@ resolver = "2"
> publish = false
> keywords = []
> categories = []
>-rust-version = "1.63.0"
>+rust-version = "1.77.0"
> 
> [dependencies]
> qemu_api_macros = { path = "../qemu-api-macros" }

msrv/rust-version bumps could instead go in the patch that also updates 
meson.build version.

Otherwise,

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

