Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C536E9A03B
	for <qemu-rust@archiver.kernel.org>; Thu, 19 Feb 2026 10:30:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vt1It-0005Ij-O7; Thu, 19 Feb 2026 05:30:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vt1IV-0005Fi-DB
 for qemu-rust@nongnu.org; Thu, 19 Feb 2026 05:30:18 -0500
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vt1IQ-00051Y-2L
 for qemu-rust@nongnu.org; Thu, 19 Feb 2026 05:30:13 -0500
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-794719afcd4so7520577b3.1
 for <qemu-rust@nongnu.org>; Thu, 19 Feb 2026 02:30:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771497009; cv=none;
 d=google.com; s=arc-20240605;
 b=AtbT7CIjFx8SUFNo+VdE20ssa5owrKhgfyAM5u0OxiExkVVE43gBTtnISNziccHFiw
 Brvm/8D9znOLdTRjMl582C6CLE+ePaR5gbPHIm6DHUWjOs3XvahozJHi2AvUzIMJbEY4
 2bfdhcCwU69VwbwJsWsp7nkelnUn9Pu551ZuJC+NyzVaG28HY+7BykxKBeDUBxlmbyby
 wL5kBivz7YtCjhKMBgzmAAXzZQhRY0TxBLsyMQXWvaE6tFpZKMaLKQIkqru+Ojn3JWQj
 VCkDWmst5YcWIhvos+Z+ro8RQOzoiRvZLSOwq7g+50oZyxJIYYAhIuzLzaNY0L/0KfJX
 kazg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=+ebn6tOBtZqV9fwgzMapnao6wcIVQllIFXvo/tE4RGk=;
 fh=yYqdJA+vO8wDT4inJ/vhT3J/FX1ySCFcFoFJnFk64G4=;
 b=aV+knBJTBONt2AL+/PRwuALHH+FLeIxylv/WNpdn2Q/01oA/PbKCn87Vb+Px93lk9O
 kUG+SLz9cvxFqY1NqD94hIiOrqV/JGj2krB3uYTl1lz80CtnvjNExv6//UjON0SEsG+V
 hIGC7L+P4j3U03d1gW7e28m9p/KhXoomvUjYZh+4QwDE6g8uQqDZlgNErHVi34A26eCm
 P2FovLyOCkmIy6L3ZlHJmVXwFIuEAuBThF3d8JUgjEkzgoGcv3g52cc4LQd5hPG9cDJO
 Dd2fLrBg3XvWDPQBJrji8QgrT7jWU4ARgyB2GXIfY3OCYOlDar6U2l7lSd+yvrUiaLjs
 qO7Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771497009; x=1772101809; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+ebn6tOBtZqV9fwgzMapnao6wcIVQllIFXvo/tE4RGk=;
 b=LACkprfClg4RZ55oNDnluo7+3zvj/BeK6JYiS87cJsltkiCWFbvw/UTum9BTsk/wCg
 Ltl713eaGQVjao0FSs0qVYWbOnm4fGwYF+hOTUptAk8XonNYHZS9oSJAKRPO59nDIdhE
 d2wMq6gPn1HAXbqDtogu8r/jIJwmZpySvweSvloehXlA0XTEY158IiKhyWNX96Eb4bX9
 /z7LKeoymYXX1ylvw8fFkEHNr8YMSzH/rEntZBqo1tZYDdvENzmGT9v7ZNzBePk6R3yL
 xL6yAV2Fwxxdu6WZcrSgu/0uOWaG0RyMUi4oJ8es2sTu0U6lNIsq63fjBIFjlCFGb6kG
 MmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771497009; x=1772101809;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+ebn6tOBtZqV9fwgzMapnao6wcIVQllIFXvo/tE4RGk=;
 b=j3cCkxallOPtv12clvvvED7DhlWllF5SYOqrfNh9zsSqk1y5WpY4erG3+KN2GbCCK9
 rkuBE4lkNQCveOTnjiVORwnmWyej9GtVoLwwZP3zFGXpwHjlRbP7pNzn2NmRtUCD0E+/
 RYCHG5pOaSNd6JGLKwyJhReV6MTROkKFhgjLaSS7nNlXlbZ2eJmwwf+Kg9i/KIuJzddC
 oAkY4A8bK8PrR79M8jVLJvDdMYRALqGAzOUKB5ZQQU1bBFkd9OF7MeuHCrGOtA0cSEmQ
 jkqN8le2VpRdNYwiQrB1hmA0vVktdVoU/CHMnrM5Izbq2C2XPqWFSe4NMIy6x/2KlAmM
 VpEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMLZfeFXzc88cbWDLxvUhWldiEDeWrB85SmvLptX2gTL5wbCF4uEeo0dqTTFC8ZNcjLTiLO/7kbBg=@nongnu.org
X-Gm-Message-State: AOJu0YxZvuBNJBVF8FykXLR3LzXJqBBNPS7MPh5LPP3IZq+wN3InUMru
 L4txD3NtUYIG6b/04/KrF67FPBls8vCHwgUrTd4PDUshML6dXnngUs2nWlsgaW3balWu61oN4SL
 5411Nnz9mJbDjC+G8KGbgmK6fKqvJKoxkGlx0J13cYA==
X-Gm-Gg: AZuq6aL2dz2JCal1dJDa+K47M8KIPntQr61hnwBvpsWoZGk4ZcoAGJoQ+tKVdo+gpJV
 KvSSnNDkQ2/dW3wBOhwckJQrra8LLH5XBPHC05u0n5PjbCzFTaQBFgqVyYO3Mh6X6IQX0BsqmtF
 SrAF4CPy18Z8feHNS6sJJB/7M95YlsI4+PlgCCduOvlBCKQGUeuWzru0r3vbOv1IiCHnBN5pFTq
 LXAWnvyD1teEf952q++gf3iFwIpnhYvzDubEJ8qxKKjY66HGKB5eV0goOJb5KnV1uVZfKWc9g6W
 ZHFTfimOcUXBotCO02U1CsWHtvUDN0Qsx9V9xk1Y+bJfxCw9KocuRcrTqhmyfSRIW1g=
X-Received: by 2002:a05:690e:d58:b0:64a:d35e:d356 with SMTP id
 956f58d0204a3-64c198c72e3mr14198316d50.30.1771497008664; Thu, 19 Feb 2026
 02:30:08 -0800 (PST)
MIME-Version: 1.0
References: <20260211152508.732487-1-berrange@redhat.com>
 <20260211152508.732487-27-berrange@redhat.com>
In-Reply-To: <20260211152508.732487-27-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Feb 2026 10:29:56 +0000
X-Gm-Features: AZwV_Qg_axfkx92o_MWe_VehT43BwlY0PdtMBFZkMa4fmyQ0hFJFoyCHoR5sUdk
Message-ID: <CAFEAcA-08J-_dn22s858QtUPV32VM4OuAEgBV-WdmGGxvJSu0w@mail.gmail.com>
Subject: Re: [PATCH v6 26/27] util: add support for formatting thread info in
 messages
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, "Dr. David Alan Gilbert" <dave@treblig.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, devel@lists.libvirt.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, 
 qemu-rust@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

On Wed, 11 Feb 2026 at 15:29, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
> After:
>
>   # qemu-system-x86_64 -object tls-creds-x509,id=3Dt0,dir=3Dfish -d 'trac=
e:qcrypto*'
>   qemu-system-x86_64: (772366:main): qcrypto_tls_creds_x509_load TLS cred=
s x509 load creds=3D0x560db818e080 dir=3Dfish
>   qemu-system-x86_64: (772366:main): qcrypto_tls_creds_get_path TLS creds=
 path creds=3D0x560db818e080 filename=3Dca-cert.pem path=3D<none>
>   qemu-system-x86_64: (772366:main): Unable to access credentials fish/ca=
-cert.pem: No such file or directory

Even more output enabled by default that is pretty useless for most
uses of tracepoints and debug logging :-(

Please can we have this stuff all off-by-default? People
who want this extra info can enable it.

-- PMM

