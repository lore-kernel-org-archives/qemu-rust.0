Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tvGTI-00042k-C9
	for mharc-qemu-rust@gnu.org; Thu, 20 Mar 2025 10:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tvGSa-0003sW-4Q
 for qemu-rust@nongnu.org; Thu, 20 Mar 2025 10:01:29 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tvGSX-000148-1o
 for qemu-rust@nongnu.org; Thu, 20 Mar 2025 10:01:23 -0400
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-e5ad75ca787so767894276.0
 for <qemu-rust@nongnu.org>; Thu, 20 Mar 2025 07:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742479268; x=1743084068; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PqEQQXxT580kj2WUkb/+tYfZkvr7JNYHOVUUIno+wsw=;
 b=eFvKJiTvFtB2rbsAe3dXUyX6c1HJTXKJg04IfKhFpOLsX31SraqsIm0pw1jSwD3oPt
 OTXSaSXHjZ8AznOVhIV9OBSXtQNk6HZbk/7UXureaHjINL/xeOsuFyoB2Qr0p4eZsQdB
 EdlZ3fjXVinwwCPym+AF5/Clt+k+bKXAXN3q6N8RzjZlYhPHXJDgWtHTMpKvg+P2E3UI
 +Ua0s44wib6KrGwO+gkG1J+dcTMli74U9XMJYTs7sofof8h/ddVaS2OceSogZNoDwseU
 c8MPK8fvEpANiPatzIQoOAAgbU35oD3s7rGu05Xb82IjrRbqJzk2iXePVQeeyvHgOf39
 jEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742479268; x=1743084068;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PqEQQXxT580kj2WUkb/+tYfZkvr7JNYHOVUUIno+wsw=;
 b=S0VVMMCASQ2DNIGZ7O13xnPCGAonEPd0rhczrrO8Be9LPTvseNz8HATPMYSohvGkpU
 sGNuJJ9Ea8g5feUZOzuFqPYTvK4v7uCZ9hLMtE9r/smEUV3AD7ZbJ1SO/MpouxP6GVOP
 JctYdVpQuVRGaU8waoXVgZRPfVy0nsr1p4v0uxgascxTSUWd61uQOGVN76/yY/EhAbWr
 rLKg2Cf8ElX6tLqO3Q2R/eBbtWDpS7WPBd0hxiC0K88x/RqJ6awuTxPruB3P29aAAnJ8
 qiYxrHXHB3Qjt8ewfy8ZJTnG6KKjRDlI0CQq1ilAScmkADuS1UWNpkes6TdEAANBlgzS
 n7Lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWXKFzvFj1BV4y/4JOnuikstqa1gh/2qphikBvY9qdrHWA1FxTxq/AuEXvHa1w6bGXhSPjyvVyW5g=@nongnu.org
X-Gm-Message-State: AOJu0Yw1nIsfArPYPZuJSwU/fPJBaJMvNMgsPZl7mds6Lcd+TRN/fNE5
 SLUxCjQoGtIyqFTE2RgAEzqMnKE6k+434roDFexYAHLZtLYx41p7FFl0L2Z/wOs8LxCbOghDKJH
 R7oxy9AKDZfKsS/mgUGGIAojIuBmnQCTENcdHVg==
X-Gm-Gg: ASbGncuz7/3N6X91eLi4HZlPd9WeLOWYLYG1ezebA2u8CyfGt+x22B9uZa8dqpDEuK+
 X1yXFnZiebAHVw2O9g6GOXFj+dyG2HJY1l5qwgJL72BPc1gaVFM8P8DmaRX6pSrrybJaf+wRZ8n
 RT5DxpSXVX1JQhehY5IjjYJeZw97k=
X-Google-Smtp-Source: AGHT+IExCFlw5PVhmWwCCWa75RC0LwfXJc8NYE2rQotzG7qe4sg6zwBRhA2p+/3PmJBdS6fDTDdgCpKtLf1JGVOCiM4=
X-Received: by 2002:a05:6902:cc7:b0:e5b:43dd:cf18 with SMTP id
 3f1490d57ef6-e6690eef5bbmr4622244276.22.1742479268174; Thu, 20 Mar 2025
 07:01:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250320115521.808019-1-pbonzini@redhat.com>
In-Reply-To: <20250320115521.808019-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Mar 2025 14:00:56 +0000
X-Gm-Features: AQ5f1JoE-7ObwXBph0MkWLLssCCKEPyP9fyW95YAmd1OGLTC3dI0rR8ncsuxf_w
Message-ID: <CAFEAcA-M6nbwbxc-Kp+jfRQ2-83zbb-G6sPwazhEzQsWSB+crQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: assertions: add static_assert
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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
X-List-Received-Date: Thu, 20 Mar 2025 14:01:42 -0000

On Thu, 20 Mar 2025 at 11:55, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Add a new assertion that is similar to "const { assert!(...) }" but can be used
> outside functions and with older versions of Rust.  A similar macro is found in
> Linux, whereas the "static_assertions" crate has a const_assert macro that
> produces worse error messages.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Supersedes: <20250320113356.799412-1-pbonzini@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  rust/qemu-api/src/assertions.rs | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)

Macro magic in Rust is somewhat beyond my current competency,
but it works for my use case, and it looks like it's doing the
same thing Linux uses, so on that basis

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(I put this patch into the series I just sent out that fixes the
PL011 size issue.)

thanks
-- PMM

