Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CF1E9A03B
	for <qemu-rust@archiver.kernel.org>; Thu, 19 Feb 2026 10:24:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vt1CK-00037Q-D7; Thu, 19 Feb 2026 05:23:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vt1CJ-00036L-IM
 for qemu-rust@nongnu.org; Thu, 19 Feb 2026 05:23:51 -0500
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vt1CH-0000yT-72
 for qemu-rust@nongnu.org; Thu, 19 Feb 2026 05:23:51 -0500
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-649e97f1e1eso493109d50.1
 for <qemu-rust@nongnu.org>; Thu, 19 Feb 2026 02:23:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771496627; cv=none;
 d=google.com; s=arc-20240605;
 b=gek85dCuKovtLTAWs9HVtv3Qze98eSbnfnBgp5mpjkJ5VpEqneYcS/Y0dz/5caiKTn
 BYzjSk2UD/pJWd4uTh4izRDW+0fwpawfhu3h+99o2RrBZc0iFGKLFyDmUBTc8cv5MxYW
 YzwHcDTmBnwu7an1UMIW5qHg3Qxa2RnLmGSgC48h3nS7FdJ2quJf3sYyszzt6nIvuVq3
 lLbDRz93Xn1hH0tLeRJYWtVJdpmMTkZnBAsX/9a+erBXpd1v7pcjzJzQjDyPpWGlWMBF
 35IVJk+Kz6nLwvcnBX3A+P/y8v8ei7m/Bu/7ooyCGZtNpInnUw3Wu2mOwkDMEdDLSidc
 rliA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=jQYXw6sx10gUEwJLfbA+ICno0L/ffvARi0dVcJmefc8=;
 fh=5zmPVDrIZPsVznCwIMxussCoX8Q94iM4uMjDHUM/DPE=;
 b=K4PpJIXbnD4BeO/nrzMkAv9dqNHzVFJ0SBcU91ZeCx3nuAmJZ0bC+AuUIn9FEWyy0o
 Kimsl/3ECG3rW5HjKBiEiTiwoFQ5z2+13nMTKpWfbbGtQCmpHTNZo41lyWkuZRCblv6O
 JQUrtFkz8NqSgzzyU1OiFtu5Q1zPoogIuH+KUm9BPs279L8L8J6BfBiv6D7Qvzrj7MTx
 3S5ZfOHItEjxdw+eMzpBJxBt+PUR2mVfeAWLuxe9vRis+84xBPwfkDKwr/0MRKrhu97z
 KjdaY0JNul8YBy1Z1e3Z51hxWL5tf+c3UhPn83aynuIyCH055qWDAzb2eQXgJ5znrOzR
 avSw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771496627; x=1772101427; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jQYXw6sx10gUEwJLfbA+ICno0L/ffvARi0dVcJmefc8=;
 b=q+v9gGTGbHgUOpM8NAJsqXAV+sE2fcXgvWBKEOekw6aCOVbnriM3IPdbK1OqMU7qdf
 dx+Qva1MwR8+5+kI74YgKoi/WDMSLgrO6kevuX8m/uL2AYRwadEqOZYzZUa9w974Bsl3
 i6NyfN/yqyFPiSp/yQtxWQse85yPr6MIRt+7a5Nvws2pd4JaH2WmaDB7Jk19Qx2jy4ur
 cVUpWCXFkN1VH99ye5Hm4TnmkH7z30LdgGIgJMKV9dsCoKtc5NdvorJ1qLKZ4jSF1it3
 A4K2y7ulqkLo6pbJhC2ct/vKpnv1U8SwrfGF6fGPg8QOlxjQPHgaSDjJdpSL5gerOdU/
 pyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771496627; x=1772101427;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jQYXw6sx10gUEwJLfbA+ICno0L/ffvARi0dVcJmefc8=;
 b=BYZ6f+csx648dj7j20nS1ldQZ89tdGpKaMcYAa14z/T2Qs8iAd/dh401ZG0jrvWW1p
 GoC/BKY3nzNqypr3NBFsJQXLvdnjb6UPq5EUbknBIZYWfDCuTAt1042UUvqlME4cKoxz
 MfEQSzA3ncV2UScVi8nmozbEaDdOT3O+9FX94pwkwDEPyD8ZGqQGhS5BXkICL4bdtSqu
 yLbrNhVVT70VYUiObb1aUCcjfQHW56k6CGDog/lNUzaIch12Bwi/0FJ62ITkDr+0fiR7
 bGIDOFfzILPWT51VSR7CDv1V89K2CUcbqfpFDk+USdjp0QXTgquTSynmiyXXq1W4r4Dr
 aBwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnkJSIvmoqVlzpILc9adbTkEuGXvm6keHdiChPOH+ja+KG3Q9kCC29fBt/k8Rlkb2BkToR2QESewA=@nongnu.org
X-Gm-Message-State: AOJu0Yyvzhd2Hj/JhkEM0KXtcz+uhFAoRpfS1fT8g8U89MJ0Y1fmTp0P
 Hr/GFBICZroTzOHVRZYspkWckc3pEQxUshIx66xbU6swJB2nhrEtnxz9Cm3UMnWk5Og8K6RR2Q1
 yFvffLvznkOTAEf6s0M04LwfYY9iT6qvUpnogDPji3w==
X-Gm-Gg: AZuq6aLs6ggXcBLwz8UJoeZHNqw9kbaMsCIglwX35IX13FUWmRwhkIiHMO3IiJw6B8d
 ZIuViRkbFpSZaKxWFLuyPQgeHqSXXezZXsbGRLOxKNIxHp/wN1arPLELxrRHto+VBi02wa9JX/s
 5uFbYo4stIZiyBodM1pLnDhC0z6T7pkTsevvZUwl8RZyGP6yBrTQtKZJ1zwTPsw0dwK66IA34Ah
 5xFHpo6Z5///zzLgJ+86CYV0x5prJe9cx0wmb0I1KkfyQAZIL0QdfqC3LZIrhkE2Fx2fT4mUonl
 yAaa9KZmiPuTbAIiRPqQB/y9pr4bMCH+vhrbQfZUnTB2aMsG6LZkJjLj0qZYnJyz9HzpOBM4bIK
 Iog==
X-Received: by 2002:a05:690e:160a:b0:649:429a:4577 with SMTP id
 956f58d0204a3-64c14debf24mr12756476d50.86.1771496627301; Thu, 19 Feb 2026
 02:23:47 -0800 (PST)
MIME-Version: 1.0
References: <20260211152508.732487-1-berrange@redhat.com>
 <20260211152508.732487-26-berrange@redhat.com>
In-Reply-To: <20260211152508.732487-26-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Feb 2026 10:23:36 +0000
X-Gm-Features: AZwV_QgQBFllVjmt3-GtQ5RGuFq4ljBu7_zazL_LwSjZEMHOtS5KTQskYwLhdZI
Message-ID: <CAFEAcA-6XMp6B-V2X+=25Q7XKwy5JuOpGj9RNpN+mTNxm71wpQ@mail.gmail.com>
Subject: Re: [PATCH v6 25/27] util: add support for formatting a program name
 in messages
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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
>
> The error_report function can include the program name in any
> messages it prints. The qemu_log function has no equivalent
> behaviour.
>
> This introduces support for a "program name" in the new
> messages API, which will be included by default for all
> binaries.
>
> This change tweaks the output of the error_report function,
> adding a space between the program name and the location
> info. The qemu_log function will gain the program name. This
> can be easily seen with the 'log' trace backend, and how it
> is now more closely matching error_report output.
>
> Before:
>
>   # qemu-system-x86_64 -object tls-creds-x509,id=3Dt0,dir=3Dfish -d 'trac=
e:qcrypto*'
>   qcrypto_tls_creds_x509_load TLS creds x509 load creds=3D0x5584e13937f0 =
dir=3Dfish
>   qcrypto_tls_creds_get_path TLS creds path creds=3D0x5584e13937f0 filena=
me=3Dca-cert.pem path=3D<none>
>   qemu-system-x86_64: Unable to access credentials fish/ca-cert.pem: No s=
uch file or directory
>
> After:
>
>   # qemu-system-x86_64 -object tls-creds-x509,id=3Dt0,dir=3Dfish -d 'trac=
e:qcrypto*'
>   qemu-system-x86_64: qcrypto_tls_creds_x509_load TLS creds x509 load cre=
ds=3D0x5584e13937f0 dir=3Dfish
>   qemu-system-x86_64: qcrypto_tls_creds_get_path TLS creds path creds=3D0=
x5584e13937f0 filename=3Dca-cert.pem path=3D<none>
>   qemu-system-x86_64: Unable to access credentials fish/ca-cert.pem: No s=
uch file or directory

On the other hand if you're using the logs for debugging
then you now have an extra big pointless prefix on them that
you have to turn off. Especially if you're logging to a file
that's a lot of extra garbage in the output. I'm not really
looking forward to now having to give QEMU an extra long
and unwieldy command line argument every time I want to
do debug or tracepoint logging.

Why do we care about the qemu_log output matching the
error-report output? The logs are expected to be
quite frequent, to only be there if you've explicitly
turned them on, and to be usually directed to a log file.
The error reporting is more likely to be infrequent, to
be on stdout, and to be important/fatal things.

-- PMM

