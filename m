Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uHlSw-0006Zt-2G
	for mharc-qemu-rust@gnu.org; Wed, 21 May 2025 11:34:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uHlSt-0006YY-Sp
 for qemu-rust@nongnu.org; Wed, 21 May 2025 11:34:44 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uHlSp-0005GZ-8m
 for qemu-rust@nongnu.org; Wed, 21 May 2025 11:34:42 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-7086dcab64bso64997227b3.1
 for <qemu-rust@nongnu.org>; Wed, 21 May 2025 08:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747841677; x=1748446477; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+gdPfSv/iUEZ0iV22CDF8Ccyp/t9XL8qu/hu9upFM3c=;
 b=ABRNvDZDVlKXsIIre65d5wDd71lHLjyEji9g+QIfothitvr1p1c8h0oO+j0HfNQpHP
 6WU9gYp3PuOzPF3KeNuRi8X1h0G+tRp8UeZgAPmXNFE4QgkwURSD1zhRmM8E96spHKj7
 M5uhylLkiD0TsCQCJ+Hs2Ly+1D7NzW8ag2ryngIKygLka+aLMINNPnedIUf8yCGUp2Qq
 vRWaiCaCRhEK42khM9WqUwIbuUcDOldqewobYJLzIOwepehQE+rvXuv5Zyqc/WbW8q2Y
 4sfqGc3OCk8II90INAy2wSAbbwrD71aE1UlFtT3LMlS89exQ62twNjlw7H2AX6zrLZ3l
 Qs8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747841677; x=1748446477;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+gdPfSv/iUEZ0iV22CDF8Ccyp/t9XL8qu/hu9upFM3c=;
 b=kQNdPEslji2mUHCqLIGghPlcZ3tBvryTWsx9cJNZT6OXysfVRpgPuk2ycvotub+B9E
 7luDfGqmsUm1lOikYSobKoVP9xq2rDBoDgfJU6VGT4bkFj710AYXWn2TIkGBRLeJF13d
 +W4G6GQTNnWrrqMJ4G2mVJhn3uqrp/i8tRdP7RSdOqMDSegmhZc6CX83HhJJlmCiKCM3
 sObRZaRP4QHsxdk3wL/93MxX3LWtBc30A9l7cu+hvhq4R20tp72dQdjnszMurJ2lmn7C
 yl+Gk7Q6zvO3Yw4v4k8tg8tmrfBv4Oydj3+VioHjUE0z6rm+ey1yWRQ0UjygAQoQpoOH
 f4Ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJ9PmmvmWLwxo843YAzS34aIsfy/odO/2AQ2pD3uaa9HaF2GhGyay7vJMNyRdBtifO3pf7phI3mVo=@nongnu.org
X-Gm-Message-State: AOJu0YwifqsWBpDNh0UbBQgESdYfaI0BuxJ6/4VZfYil4Ss6zU1B6S5G
 CL1ucL86CfXQqdUge6UFnUsX5WZ2urx1NoHhMX59T3ldvJDTbjRYXnX9NaFwFl1DrIeUXSXvh7L
 m8cAYnjxYMyYz+5ePR9aH38OHn8saQdguNMHWKBcQQA==
X-Gm-Gg: ASbGncv9SYzXI5GMgykw7wOKgALgZSF3VDznQFVCKdOZ3R8QcX2jEMTYgkS1eZBha4H
 3rwrxx2UbtrrOz/+f784+C8jVLb2v4nXMDuUJH/R4rmc93IqzuOnL1aKmJQ7lJbMUsUD9BO85uK
 UXoiTDqn5LPnZz+YkOrjMj+Ty/z9MRZNrme91R6C8Hi7Uo
X-Google-Smtp-Source: AGHT+IEqiXL6sJmJknJBdAC1ULYcGaNnm5HYbGP1pXy1iaNzcNYUc1xLSSbp7Nqah/VoVnRRgBYH7kqq4fF1v6YW5uo=
X-Received: by 2002:a05:690c:3686:b0:708:39f9:ae49 with SMTP id
 00721157ae682-70ca7b8b963mr288387497b3.29.1747841676875; Wed, 21 May 2025
 08:34:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250207153112.3939799-1-alex.bennee@linaro.org>
 <20250207153112.3939799-12-alex.bennee@linaro.org>
 <ee091002-a552-49fe-ae5e-8916937dba15@tls.msk.ru>
 <56e0a35b5c53b416db130c414cd0f3d6@linux.ibm.com>
In-Reply-To: <56e0a35b5c53b416db130c414cd0f3d6@linux.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 21 May 2025 16:34:24 +0100
X-Gm-Features: AX0GCFtQTqAUvcQ2co9hZjymHoBFnNlqTY5AGz0B7rNw7UAqe6lSJQfx9Cc154E
Message-ID: <CAFEAcA8Mzo-Ne48=uFBTcy+CXNcnxGOaW941p=CRkD6gmC=JfA@mail.gmail.com>
Subject: Re: [PATCH v2 11/17] gdbstub: Try unlinking the unix socket before
 binding
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 Weiwei Li <liwei1518@gmail.com>, qemu-arm@nongnu.org, 
 Nicholas Piggin <npiggin@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Bin Meng <bmeng.cn@gmail.com>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, 
 Kyle Evans <kevans@freebsd.org>, Alistair Francis <alistair.francis@wdc.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>, 
 Alexandre Iooss <erdnaxe@crans.org>, Laurent Vivier <lvivier@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, Warner Losh <imp@bsdimp.com>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-ppc@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-rust@nongnu.org,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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
X-List-Received-Date: Wed, 21 May 2025 15:34:44 -0000

On Tue, 20 May 2025 at 23:22, Ilya Leoshkevich <iii@linux.ibm.com> wrote:
> However, wasn't it already broken in this regard?
> With fccb744f41c69fec6fd92225fe907c6e69de5d44^ I get:
>
> [2/2] Linking target qemu-s390x
> /usr/bin/ld: /usr/lib64/libglib-2.0.a(gutils.c.o): in function
> `g_get_user_database_entry':
> (.text+0xeb): warning: Using 'getpwnam_r' in statically linked
> applications requires at runtime the shared libraries from the glibc
> version used for linking
> /usr/bin/ld: (.text+0x2be): warning: Using 'getpwuid' in statically
> linked applications requires at runtime the shared libraries from the
> glibc version used for linking
> /usr/bin/ld: (.text+0x134): warning: Using 'getpwuid_r' in statically
> linked applications requires at runtime the shared libraries from the
> glibc version used for linking
>
> This comes from glib, but the ultimate result is still the same.

Those are in upstream glib, as you note. We can't fix those (unless we
have the enthusiasm to write patches for upstream glib: last time
we asked, they were not against the idea, but nobody on either side
had the time available to try to write the necessary patches).
But we can and should fix the cases in our own code.

> Also, what are the symptoms of the breakage? IIUC as long as execution
> does not reach getaddrinfo(), which it in this case should not, because
> it is used only on inet paths, there should not be any issues, right?

Correct -- if we don't call the function it's fine. But the easiest
way to be sure we don't call the function is to not link it in :-)
Otherwise future code changes could result in a call without our
realizing it.

Also, mjt's packaging for Debian puts in some stubs for the
offending getwpuid etc functions, which suppress the glib warnings
(this is why he noticed this whereas none of the rest of us did):

https://sources.debian.org/patches/qemu/1:10.0.0%2Bds-2/static-linux-user-stubs.diff/

thanks
-- PMM

