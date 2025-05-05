Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uBsFE-0002JI-Dy
	for mharc-qemu-rust@gnu.org; Mon, 05 May 2025 05:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uBsF4-0002C4-0a
 for qemu-rust@nongnu.org; Mon, 05 May 2025 05:36:11 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uBsF2-0002tW-6K
 for qemu-rust@nongnu.org; Mon, 05 May 2025 05:36:05 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5e5e0caa151so7367389a12.0
 for <qemu-rust@nongnu.org>; Mon, 05 May 2025 02:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746437763; x=1747042563; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I1qpMR+Q/kjChxa6Bop8ESXoZDWcbc4HZXmKnxbYAUY=;
 b=cCjj+lLpZjfjSLsfG+HvXZ/dQeCy1N+sOmEx2Fj3w0H2VfGbGvHb+L1Undx2iVWJrb
 z/kp4Pe1gQ9LNhm/fqE0IyW1zEc7WD+xjEoadarhNpMzOym62PWaSgQ/BPc2C2KTs6y5
 f3vL3CXQ5PZMvxP4EHhcIVoRUz6QwDaRlTY5G6MNLe2F2RRFiXgN+VkqmuQetfBLbI+s
 HHcbgM8B6SwHQlTZCGkkF6hkn/+ZtFmeqB4Lq0xb80dk83hBAtZ37ASb8pa3yJpYJ6dQ
 JK2NyRjbvGly1eV6G2IzaOXUscF2FEPMnpHFCRvOhCgsegI84p9iN5NzR1tPvpPcXo0X
 XSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746437763; x=1747042563;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I1qpMR+Q/kjChxa6Bop8ESXoZDWcbc4HZXmKnxbYAUY=;
 b=HXQ9I0/atGipKNqZ5w4M5ebaHjG2Y4K7mGvZkEnRT8TR4741bh2VdkRXOvC1/kqV5X
 D881WuM1ZPjz4fpBx1Y1OFovXFST//G1CZq3pxZwOA7r32pEZdxfW/oEeWOZVYPQsgU9
 58zNeaycUYmlJ1MRnqkl731OmcqECuYkMVs7OjYwo4xhEEvhtY24XvKktk8dAlhqiyBE
 rGsWeV/bEkb8aiy/20z/20G2+mc3uekqs/Rg8iTf77q1B00TTsd/cFn9G3gyUz81jf0u
 MRyOD+57hTPgO7GZbyqCxkxII8DLK3Wno7hVL4l1yJkluvjQPMnedm5HnpTaB1m4BLVY
 bA1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX0rSSMNL/EJf75/fj+EHg8vg70XzZQwokaR8JVpM/LUpyuNGSZ/ThxsFvQkhS3C9X5E1UIqtB5lM=@nongnu.org
X-Gm-Message-State: AOJu0YyFXVCn9cpEFDU4UvLZJQwWLUWU9yUzVu3JGXSh0CkCh7RL6eEp
 2kT8KZeQdkdSt+fcF9yncufE6lgmwTkVNbf3y72HArvtD5RYl8+M2yFYnUKiHX22N8gOLZsLDlt
 icnLgB610pb+TXVEZ5KKhlvs0ckg7meYmqQdCjzdKA7bRplJLGjYVgA==
X-Gm-Gg: ASbGncupw8dy+074E3anTBml6iYU0NnG7K//Rw9a+CdpryVTofqlMQ5Zhuqjujydm6q
 Ct0DArtmn+3dpnQimWcl8cKeqztZoNPwXcNxvC6kcwZliNzv/GfMyknzf61m+IegkX9Ea96AVsX
 g6AO+1fQ8cUETgwe2ufc9j
X-Google-Smtp-Source: AGHT+IEMgi7EPWSHAjxSPAl34WpBIE+Fmc6j6NKuVNglWMpKMoAYu81hIYNCPydbLSS0VDFfZ5SGma/K5k08ETsv4T8=
X-Received: by 2002:a05:6402:2709:b0:5f1:e466:660 with SMTP id
 4fb4d7f45d1cf-5fab056d2a8mr5077894a12.5.1746437762790; Mon, 05 May 2025
 02:36:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250505090438.24992-1-pbonzini@redhat.com>
 <20250505090438.24992-12-pbonzini@redhat.com>
In-Reply-To: <20250505090438.24992-12-pbonzini@redhat.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Mon, 5 May 2025 12:35:36 +0300
X-Gm-Features: ATxdqUGmyrfYUvID5ghYaxFx8w7XGhVmPgrWLPC1ubzaHeioYKJvD6nB9LWlIdE
Message-ID: <CAAjaMXZkku0kov3ocZ8E6C9VMh-nuPt96kuyhrFCRQB84G0oxQ@mail.gmail.com>
Subject: Re: [PATCH 11/11] docs: rust: update for newer minimum supported
 version
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x533.google.com
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
X-List-Received-Date: Mon, 05 May 2025 09:36:14 -0000

On Mon, May 5, 2025 at 12:05=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:
>
> Remove leftover notes for Rust changes between 1.63.0 and 1.77.0.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  docs/devel/rust.rst | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)
>

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

