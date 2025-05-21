Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uHlZf-0000dE-Nm
	for mharc-qemu-rust@gnu.org; Wed, 21 May 2025 11:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uHlZe-0000cS-De
 for qemu-rust@nongnu.org; Wed, 21 May 2025 11:41:42 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uHlZc-0006W3-1Q
 for qemu-rust@nongnu.org; Wed, 21 May 2025 11:41:42 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-70dd29b0d34so25898297b3.1
 for <qemu-rust@nongnu.org>; Wed, 21 May 2025 08:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747842097; x=1748446897; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=spfLx4z/2w6V3UeSHe3VBdiO1OMuzXoFQOHptwcYaYc=;
 b=GqmtG4yVqQZ+Mq6tvFDkbDw7sF7N7XPbZKaCy0TbsMORTt29ewuZhyD4gi++k/QySZ
 jcDeETZm1JSwXAxsjxjSJIOKTwkLN1t6+8m+Grs4Cs+mrRcKZ0c6AwJvJOxeaulTuk0Q
 k9q2yxLSBpOHcN72D4iH0zK2SPIL2XHd0mH/32cLVgtTgq19ia+7OEq1iRWC4yIvrpC1
 lsCARruOWz0eA3PbM/MkBYPG6ge6V/GLzWDimT6dnBuzk6hkBoHjRzkqgcle2dGL8zLt
 y26cvwD3Ib1Ac4TjUKS9t8w2gSXZHeEotqDcQJt88CI+ZZ8vnfQRYm+bass1LfgRQqHl
 FcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747842097; x=1748446897;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=spfLx4z/2w6V3UeSHe3VBdiO1OMuzXoFQOHptwcYaYc=;
 b=grCSpnLMSNzcHZUwDgBlQF+y5V0LrfHnehRyLCB6bfuz1LUSmStrrO4kl2qzAhnjPh
 3a2RaW3vUn3cLnPLbtRKVwQ7YPK1Y42VsDY0IewKYF6rii1DuBv7kuz2JwzWlCYw+0eU
 RoK44iezyC3lXdb0kyP5H8fGBE31CImqP4vJRDa0K+kAqeaQRpaN+SC1pxDzSRFvEhqJ
 x5lnD8Ws28DLvvtKsAYhsWDWsLeyzQVFnKbxOYXhxYI/P73vAQBqkIcFfXGba3rNxZ1C
 7eQkmLWq4nqpVPpPTnkZ/Zhr/yiMloRXr14UY+34qHHiCODQ/4n0YavhoYPaGcTRcPSO
 1USg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWf5jVNHdMzyoDMuo1MwoZdqa/3Poi4cCWBQKgzARw4pu2e+Hv+x7BVQ64LVKDY5utcqBVIGOptpmA=@nongnu.org
X-Gm-Message-State: AOJu0YzF44h1jqbXfDWDh2sioToqO0GWzaGykkjgTtA1pt4jmY2UIoe7
 vpndjCKNc+tGTWkGxlrX91iafdi5rNKuM5jdqokIY/g/74NOZM7WZqYzp4xeLIavHvgF2ETri6j
 9E++k0qeybXgBVqCgAIIq0Vt2cBoGNJjO26JLxoeGOA==
X-Gm-Gg: ASbGncu3QYlpE1kyc7aQK87GqgsykZoOY9beP+Yn2Rqp1WtPGF7u86jATeE/8BJb5+J
 Cs5+ub6+9hweQ8QS2xhg8KFrb7i4ghj94X9qhW981m+EiHIXNTXCVDu4zzzdkkumWcZCmKDx/wc
 mxRB9svObjjTI7Kf7+DppnK9y1bSiL3J46BBotD9YYjK76
X-Google-Smtp-Source: AGHT+IE4lqVILNbp+91oyYEN/v1dl/Zmyx+CpYjMBQPP1jiCqBYQw6fdo1H43hpPWRJPQhryy9tig6s4K7Ji5mcRMms=
X-Received: by 2002:a05:690c:6002:b0:70c:beb2:d15d with SMTP id
 00721157ae682-70cbeb2d57cmr238950107b3.15.1747842096924; Wed, 21 May 2025
 08:41:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250207153112.3939799-1-alex.bennee@linaro.org>
 <20250207153112.3939799-12-alex.bennee@linaro.org>
 <ee091002-a552-49fe-ae5e-8916937dba15@tls.msk.ru>
 <56e0a35b5c53b416db130c414cd0f3d6@linux.ibm.com>
 <CAFEAcA8Mzo-Ne48=uFBTcy+CXNcnxGOaW941p=CRkD6gmC=JfA@mail.gmail.com>
 <aC3zT7gOMn4i-d4U@redhat.com>
In-Reply-To: <aC3zT7gOMn4i-d4U@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 21 May 2025 16:41:24 +0100
X-Gm-Features: AX0GCFv5PEVvm_Y2xRgD4c7fEzTF202zrflBykavwYv7tsKc7GPCnyfB1SeKVGQ
Message-ID: <CAFEAcA_M5cJ3atABVCdR+_p2t3wvr3+Pmesq9Hs39J9c2ateWg@mail.gmail.com>
Subject: Re: [PATCH v2 11/17] gdbstub: Try unlinking the unix socket before
 binding
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Michael Tokarev <mjt@tls.msk.ru>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org, 
 Peter Xu <peterx@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Weiwei Li <liwei1518@gmail.com>, 
 qemu-arm@nongnu.org, Nicholas Piggin <npiggin@gmail.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Bin Meng <bmeng.cn@gmail.com>, 
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>, 
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
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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
X-List-Received-Date: Wed, 21 May 2025 15:41:42 -0000

On Wed, 21 May 2025 at 16:38, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Wed, May 21, 2025 at 04:34:24PM +0100, Peter Maydell wrote:
> > Also, mjt's packaging for Debian puts in some stubs for the
> > offending getwpuid etc functions, which suppress the glib warnings
> > (this is why he noticed this whereas none of the rest of us did):
> >
> > https://sources.debian.org/patches/qemu/1:10.0.0%2Bds-2/static-linux-us=
er-stubs.diff/
>
> Oh interesting, I was conincidentally wondering if adding dummy
> stubs might suppress this.

If we do I think that g_assert_not_reached() is probably better than
returning -1 etc.

> How about we pull that change upstream, and expand it to getaddrinfo
> too ?  I like the stubs much more than artificially splitting up
> the source files

The stub is still effectively a runtime assert. Splitting the
source file gives us a compile time guarantee that we don't
call the function, so I prefer that.

thanks
-- PMM

