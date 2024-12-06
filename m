Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tJW3x-0005Hw-NM
	for mharc-qemu-rust@gnu.org; Fri, 06 Dec 2024 05:59:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJW3v-0005HE-Kg
 for qemu-rust@nongnu.org; Fri, 06 Dec 2024 05:59:55 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJW3p-0004lN-DL
 for qemu-rust@nongnu.org; Fri, 06 Dec 2024 05:59:53 -0500
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a9a977d6cc7so272089966b.3
 for <qemu-rust@nongnu.org>; Fri, 06 Dec 2024 02:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733482786; x=1734087586; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cCjvmfEs5EJgidXuCv0XGMV7m2dF6rGGbBlwA4fs2fg=;
 b=qPOQw5fJgK3T0ZuIMpcrzUOfWTcz0ErHgQTYtxC/ApXz0Z1dPySTsNBkLu8cml+Y9t
 pTya+H/MUHBuSJ+sJsTxorHcqJvL4GL7V6I1Yn6NqgKcYM4/YpeiE2GO3tRHgHsQq0l4
 BebT8WtAoT5RuPMg47iuDYe3/GMH+fYz2lmz5vZPQ00qtlYzmdTWq6QkKwp9H50m2ADG
 029HQhzudTu5l91shtg7ZvSg5FK2naLf9rJn0ruRk1/S0mqNXx/Dr6CW58AeIgmUZB9K
 qd+2p6+B8AkyWIUcOJy5CzIM0HSAwHcWcMY4urnruALzoE3Yz4A9i0JJzR6mzeaxViFj
 nMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733482786; x=1734087586;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cCjvmfEs5EJgidXuCv0XGMV7m2dF6rGGbBlwA4fs2fg=;
 b=iIV8lDmYM9BRqpm/8RxDBCq4Wfmg6S4KPyaIoHyg+wDMBTFPrkz7t46vHB2lH28Hcu
 A02/tB0rh4qA8FgfZZZUkNgztXEuwawbAR/hKYM65K6goNxJUKid/YC8KTMBh39pmGKn
 fpenaGvqGi/Pa99FmXmbSKewusIvlzsPk5a7BveX4w54/4aWWSXV69Jerx2nM1Gi6Fhl
 Pk9AeaPPcZsWAgsTCPbd5/+q/WPiVXaOH3CPPd5DofHokIQztTe0gSjyzSmqqZ4x0Bzj
 T2QE9lNzMeEj95hvQ6hu98rUMfNU0hovXxhm89ca93W0ZbVStZwDSulAjbuJ467PbeK0
 z23w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEcvylQdEexAWuGcxWVszXmzABllEuXbadBBMxmD0+Hrrtg1fof2t/1IMQbm8aIFN5ONTERyB7TWs=@nongnu.org
X-Gm-Message-State: AOJu0YyUcImtZBddQwMEoMBfsTVc3iwyCeOVP8rgV85HLOqdlTJMckSp
 gPlqJSNEYv42W0ru9LugMg+s5HD+XYg/D2vn1msh/+u/zcMXo3Q7L1dACRuLUhAh5g1VmnAPt9Y
 aM/YcOCTm0bJbxWIrLYaPTK3jY57SnFCFdr+cBw==
X-Gm-Gg: ASbGncv2QXL4W9FepmMqaPxYjjTIi6NpyB5dL3O4DGXIp8LuuxrSXbZOcjZjqguEwIe
 +anYH1o5ntlTW7qL6XKVMUHYnTxSWm0fR
X-Google-Smtp-Source: AGHT+IHwzOcUzTAejnJDa1pS1n1NDczMHLQrdR232D9/vsdR5L8/dNlSMgwd3uJnhocg06m4DZM5GrHKgCrAjZhKNIQ=
X-Received: by 2002:a05:6402:3604:b0:5d0:d2ed:ebb with SMTP id
 4fb4d7f45d1cf-5d3be661a54mr6052184a12.3.1733482785871; Fri, 06 Dec 2024
 02:59:45 -0800 (PST)
MIME-Version: 1.0
References: <20241205060714.256270-1-zhao1.liu@intel.com>
 <20241205060714.256270-7-zhao1.liu@intel.com>
 <b34733f3-1525-4e35-8c07-f84ad56b01e0@linaro.org>
 <1f008c2a-aaf6-497d-becd-f36f5d9aea17@redhat.com>
In-Reply-To: <1f008c2a-aaf6-497d-becd-f36f5d9aea17@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2024 10:59:35 +0000
Message-ID: <CAFEAcA9SCfMcrhpd_x0LmgwtD-5XwT4TY+QXBJMOjWbdtBPCUg@mail.gmail.com>
Subject: Re: [RFC 06/13] rust: add bindings for memattrs
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
 Junjie Mao <junjie.mao@hotmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, qemu-rust@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
X-List-Received-Date: Fri, 06 Dec 2024 10:59:55 -0000

On Thu, 5 Dec 2024 at 18:30, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 12/5/24 19:15, Richard Henderson wrote:
> > On 12/5/24 00:07, Zhao Liu wrote:
> >> The MemTxAttrs structure is composed of bitfield members, and bindgen is
> >> unable to generate an equivalent macro definition for
> >> MEMTXATTRS_UNSPECIFIED.
> >
> > I'm happy to move away from bit fields to uint32_t or suchlike to enable
> > MEMTXATTRS_UNSPECIFIED be a compile-time constant.
>
> Yeah, if we go from
>
> typedef struct MemTxAttrs {
>      unsigned int unspecified:1;
>      unsigned int secure:1;
>      unsigned int space:2;
>      unsigned int user:1;
>      unsigned int memory:1;
>      unsigned int requester_id:16;
>      unsigned int pid:8;
> } MemTxAttrs;
>
> to
>
> typedef struct MemTxAttrs {
>      uint8_t unspecified;
>      uint8_t secure;
>      uint8_t space;
>      uint8_t user;
>      uint8_t memory;
>      uint8_t pid;
>      uint16_t requester_id;
> } MemTxAttrs;
>
> is still decently packed and simplifies things a lot.

The old struct is 4 bytes, and the new one is 8 bytes. We do
a lot of directly passing 'struct MemTxAttrs' arguments around
as arguments to functions (i.e. not passing pointers to them),
so increasing it in size is not completely free.

thanks
-- PMM

