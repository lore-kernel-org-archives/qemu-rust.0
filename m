Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1t9X6L-0007U7-Ud
	for mharc-qemu-rust@gnu.org; Fri, 08 Nov 2024 17:05:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1t9UNc-0000hk-Et
 for qemu-rust@nongnu.org; Fri, 08 Nov 2024 14:10:49 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1t9UNa-0002Sg-0G
 for qemu-rust@nongnu.org; Fri, 08 Nov 2024 14:10:48 -0500
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a9a0ef5179dso404272266b.1
 for <qemu-rust@nongnu.org>; Fri, 08 Nov 2024 11:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731093044; x=1731697844; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Y28Gf/YpD42AlEjMGjgP8OA0CoYWr1vvY5+m1N00XM=;
 b=PLlWOuXj+THUXpqEp8XbB9WGdHTxcmPBINnKuYpsgY6OVpN5KygDTSHjH79BgvKDnz
 cfmM3sX51A9T/FdOFyxq3zhVr0DrVQz963gA73LP7ZUYW+UC7hQyXnEfrzK3onggCX26
 5aQYR2td8JqFt+RlRKDDdfiVpvtjlezh0yKQ7m5E8Xzl4yblRnACeACL/2F1AWS8b0x7
 /7TTu+yOqdyItCyaSYvQlg56WgxjIPcJ1YQF8eprlRDw9vEGUnnYMLMXazfAH41O90Te
 AqwQ1R34o5go9iZ7rVmOcbVWQs94MAT53X41edSLEFTHLUKEBkroDYt8bOpAvUb8a8RV
 5tAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731093044; x=1731697844;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Y28Gf/YpD42AlEjMGjgP8OA0CoYWr1vvY5+m1N00XM=;
 b=iDLTDtYWVY8vtP9Tww58d2tJ/Zhu45EUkyQEz8ur/Tp2oQRu28lAaOBUpWF1ULOK4I
 70kA65xqb2EY/7ASYe9FEOMRzQCHrda2rmNVgzkrx2hb04Mz/eetBYgumGoRHxKhyIPg
 lx5zUQJdqh/aC4fp6LasRAqo+1Xkp9bX/M4KQIejQTxt+pG3N/5rzG/40+6k7Hyi5cjB
 mBQhBdTFIB5DYlDaFX38oh+K5QIM+duEDa89v4QokjdceNOhQozUEy63l8grbra1izg1
 CESju01nR+H45D7hrButE9WA+4ar7tiAlSvFnqf5f2BTCNf2ZcajTXcsyy5LP47ZjkpG
 VsdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzrYNIseQpUaiZv49UJNkV/EI8zAzl1mHGf/h8pW/Yt0dvgTy9BhFS8enRvoWw9fAIkG4Uyuq2UDo=@nongnu.org
X-Gm-Message-State: AOJu0YzxqPTalCPv4BTM1vLtDZhSP2AIRRozPcmiKYVzjW0peji39wbm
 kajr3p3pwRQboYKsbXz+jj+20tAp5yS1jNGH1X5vgWkLoJw9eTPUjSJEoY3mgELXvE2Eys17v4n
 yy7OrmbB76ayyDMt+RtVAS8hqoBHP6R+P+l1tvg==
X-Google-Smtp-Source: AGHT+IEsKFouMC8tB0nZ3lsuep3lpfm1JksZpkpo0FqpgQO4z5KRLMBpYStMHFcg06P1RCbVMid0Ijf+C0LDBmVgWAk=
X-Received: by 2002:a17:907:94c4:b0:a9e:8522:1bd8 with SMTP id
 a640c23a62f3a-a9eefebd13bmr411170366b.6.1731093043646; Fri, 08 Nov 2024
 11:10:43 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA-ZQuyGTtG-vhRTEwpz0L4cpimNxkKix45Yw6gVHXozRQ@mail.gmail.com>
 <Zy4zXtZK_9OnXSJU@redhat.com>
In-Reply-To: <Zy4zXtZK_9OnXSJU@redhat.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 8 Nov 2024 19:10:17 +0000
Message-ID: <CAAjaMXZ_VXE+2Wk-5EhdLARx2qS2qMuF7k6xRs21LdJ0vxPxXQ@mail.gmail.com>
Subject: Re: qemu-rust@nongnu.org mailing list created
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-rust@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 08 Nov 2024 17:05:08 -0500
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
X-List-Received-Date: Fri, 08 Nov 2024 19:10:50 -0000

On Fri, Nov 8, 2024 at 4:51=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@re=
dhat.com> wrote:
>
> On Fri, Nov 08, 2024 at 03:13:58PM +0000, Peter Maydell wrote:
> > One of the things suggested at the KVM Forum Rust BoF was creating
> > a qemu-rust mailing list. This is going to be one of our usual
> > qemu-foo lists along the lines of what we have already for
> > qemu-block, qemu-arm, etc, and the standard policy applies: emails
> > to qemu-rust should also cc qemu-devel so people subscribed to
> > qemu-devel only can see traffic. The separate list will hopefully
> > assist people who want to follow Rust-related discussion and patches
> > in identifying those emails.
> >
> > You can subscribe here if you like:
> >  https://lists.nongnu.org/mailman/listinfo/qemu-rust
> >
> > The list should be set up with basically the same config as qemu-devel;
> > in particular it accepts posts from non-members (though there might be
> > a slight delay on first posting from a non-member).
> >
> > Please cc qemu-rust on future Rust related discussions and any
> > patches that touch or add Rust code.
>
> Can we get qemu-rust@nongnu.org added to the MAINTAINERS file
> for every entry which touches the rust/ subtree.


I will send a patch.

