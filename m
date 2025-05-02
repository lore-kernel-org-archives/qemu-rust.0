Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uAqFi-0003jm-Tu
	for mharc-qemu-rust@gnu.org; Fri, 02 May 2025 09:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uApnq-0006up-6F
 for qemu-rust@nongnu.org; Fri, 02 May 2025 08:47:42 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uApno-0007vm-BZ
 for qemu-rust@nongnu.org; Fri, 02 May 2025 08:47:41 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-39bf44be22fso1401335f8f.0
 for <qemu-rust@nongnu.org>; Fri, 02 May 2025 05:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746190058; x=1746794858; darn=nongnu.org;
 h=mime-version:message-id:in-reply-to:references:user-agent:subject
 :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7s8A52G4FFIf4gsa/3QPjcg6BWvLhHTy9zX8xBcoRuc=;
 b=NnxBie/mG5QyvI3Xd1PZzFrc6ULiEN1udYkwFVoHZL09g/QgPLHw8ZdmeOEnInEKPa
 ZwJ/8B87cNJBxAFTdcv/g96VZkExrZaMW5yGCvyJGq/l/SLhsGe6lanPLrhownoaKWvP
 SuIZkXB6DO8CaAsU6vbVmDvoGKy2wD9Ls0ZiFBpjlujo8m8YDMJXSF/99Sz8Wtg/23OR
 9JFiOgcRl3kXxk7DuG6nMAChtBTq7bx2GRVGotZowxh/W54gvsVcwksau4GnfTyBOiWF
 1BRrCDT+WZAFm1aLOuvFAj1fh5CffR+ntCOIYffC5qIKnZTNDLNsRDO/lnIYJyGuhg/X
 ZZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746190058; x=1746794858;
 h=mime-version:message-id:in-reply-to:references:user-agent:subject
 :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7s8A52G4FFIf4gsa/3QPjcg6BWvLhHTy9zX8xBcoRuc=;
 b=IrfPUxp9NjEOeQIix5NLi41V/HytpncPS4PGxX2A0fCKWExln0P0/veNy7oWxZm0Ti
 4U2xngPvVctKbBnu8p5LIMzt+qviB98kXRLLln6gtiLfec/RdS5HJsftaDLkeUdak86F
 V5LjQMkcedbQij22uDdH6mKR1rr9IcQ7EIoOmt4ROffqDa2IpWiUQqcUrVeryLUwpI4V
 oDgWCqrTTM+uqMihsQas7QRMJfJsyxL2I73kQijIAWHUdlAVDajxCKAYuMmk44fl5hGK
 Dgjf8h688yOKraYjfsb4PVXS0N8BjrHGjKG7EoHnHtTU4g/LhkGjDKUF70w0WKtLerHQ
 5cCw==
X-Gm-Message-State: AOJu0YxqlVijuieh6Fj4gTnsXxRQ5pf+2UhttriNN3MOl6S3lqW9ehpi
 j3mReEZzUK9s6ksjnQhU92AeeAKWaoWrMUjUfyyX5LRzT8dgzkFbcH40zoUvOic=
X-Gm-Gg: ASbGnctgt+DfPKkeyxiGbGuchs2D+i70Zjvbrz9d1D3KiTaD0m85ffUgsq9aleSiCuG
 QzoGWNtuwGET4dRMJLq0j43fJfTQhjUDlNleQ/cjYzSYhnV1NRJkcvGKqhebADg/vVksTc68hyU
 ZasYRRMKSvhEDqRj7j91yt9O4vzw5aeo+x7x1E7OwhopEpCvVGLvLhL7VsxTQT4rjVtbdKjEXQY
 eEYM/nTg4KrZ3Ubw9CKc9QY4MWltx+gjWY2s1fhkKNjrvPyYt1diTKhs6Y9BhjTAsTW5TiibSsI
 xuv/zxB57TwEWpYtg7OGs0sfIw0KE+ZO3o6vXCiQwNmxxtFsXLXCCQF8nXEjbSajjb4DmeO+26+
 ZTvpGuQ==
X-Google-Smtp-Source: AGHT+IEk+vS0zK4/AbjgnBXSQz3ZaCLrGkP9Fe5NXQHXPqWZqs8p6UYJNRx0L1Sq6+uBsqOusrT6Jg==
X-Received: by 2002:a05:6000:250e:b0:39c:142c:e889 with SMTP id
 ffacd0b85a97d-3a099ade119mr2003182f8f.27.1746190058441; 
 Fri, 02 May 2025 05:47:38 -0700 (PDT)
Received: from meli-email.org (adsl-37.37.6.161.tellas.gr. [37.6.161.37])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099ae0d15sm2132881f8f.13.2025.05.02.05.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 05:47:38 -0700 (PDT)
Date: Fri, 02 May 2025 15:45:23 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-rust@nongnu.org
Bcc: 
Subject: Re: [PATCH 4/9] rust: qemu_api_macros: use "let ... else"
User-Agent: meli/0.8.12
References: <20250502102323.104815-1-pbonzini@redhat.com>
 <20250502102323.104815-5-pbonzini@redhat.com>
In-Reply-To: <20250502102323.104815-5-pbonzini@redhat.com>
Message-ID: <svmwvd.2r122ko0uqc0j@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 02 May 2025 12:47:43 -0000

On Fri, 02 May 2025 13:23, Paolo Bonzini <pbonzini@redhat.com> wrote:
>"let ... else" is useful when visiting syntax trees, to avoid multiple
>levels of indentation.
>
>Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>---
> rust/qemu-api-macros/src/lib.rs | 84 ++++++++++++++++-----------------
> 1 file changed, 40 insertions(+), 44 deletions(-)
>


Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

