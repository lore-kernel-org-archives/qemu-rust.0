Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uXfO1-0003NJ-4P
	for mharc-qemu-rust@gnu.org; Fri, 04 Jul 2025 08:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uXfNm-0003Kv-7f
 for qemu-rust@nongnu.org; Fri, 04 Jul 2025 08:19:10 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uXfNh-0003kL-Rt
 for qemu-rust@nongnu.org; Fri, 04 Jul 2025 08:19:07 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-604bff84741so1528937a12.2
 for <qemu-rust@nongnu.org>; Fri, 04 Jul 2025 05:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751631542; x=1752236342; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oJfIR9UWsxS+bqd1tEuMyoRls3ClDB7lB9jYjN8f+ck=;
 b=NbvGuKaXdGy6vlJHqB6R0hTyaasE8TtBELA7NnrvTKyy0D8IDggmPqeglUozoMNPAR
 V1FWeWflNZUsgC/2J5YVCugIGVz3nQaszy5JT0nGA09poZ7RnaD5aAc3UVZzCyo52tQa
 Dt8YOojiExWS3nyVz0xPol3dIuHNR9ssZc9TZzxARFcTY5NN5QDbXbSq5DqMlhZ3kKzI
 2N0sNa16RO6bI2rZ1B0I/IBjEDSciZy9HgWuvO2Q+GnCgb1vyhP1KadQ1Jz1dZ27MWOU
 8rcZqQoLcUo3OIsWEDJPIOjUJwdp6n0MwsZaYJX0LGnpuj7wBBtvd5QHBrjc78cmBOy3
 dxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751631542; x=1752236342;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oJfIR9UWsxS+bqd1tEuMyoRls3ClDB7lB9jYjN8f+ck=;
 b=Vprm9R9pUYOZFc7BJb76PN7or60It0UKURKFhaQeGQcpRUYIUrf8Yy/pupYbNLP565
 dPU2nBPuJz5KohdfTBdVSRVaKFHeYdq9OByLGMiGp2Ls6eHsodarzHcax7+zO/J7fEPQ
 cABUfJjawaeNC4k1+QBa1qToBbFGMFtQ4ZBSZUR+deM48JxwcSafCnTSTuz628y5orwt
 qCntgFwtTluhJI/teYXjeQcPNifBimqPXJrpYcRphOH7/KqDJwGqdLuD1kaX3DVEMnSD
 wO6KKPUWykyaMhnqCqIbEq5/+cREr52TYzsJZxo35ZL0VdlUbfuizeNG+0U35DHPuPXk
 W8Mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJm22I8GQMNRhy1UtnSO3t1l2snjH+XODEWDN2a4XhC5kQorjpiqhOMJDetZ593LwjoCJrhm+F1Dw=@nongnu.org
X-Gm-Message-State: AOJu0Yz6lR1G04cKfkP9BOykeuUdY5U0vXRDCmR6qmM7+OPJrcLjZvuH
 UyW+5gLzJrDAsti8kajmq/CzGCv4LnYcij2jR8yY/ytZfMNKNwQ3h/bUni50jkdo22DytjTe9ZM
 v5Ie9fmiLxQ76Eb4WZbfIWEUhFfbITDBCctum/LF7Pg==
X-Gm-Gg: ASbGncsCmjIwVQ3AX07d3elgYfLXkz2RhVoWJZx6alcjOoK9xEr+iwZUPFLuFjyGmLr
 lZAwyNM9S2qH2evfMJ2d6g3q1uB/eUNdHHi0ky0lizGGvpwDZHLrp4Vypn9IEUcOwjihtjdEq6Q
 yI5HHpaT1krNX98+yEXw8ocdjXsTNQqhxHnvfe1ZQbjSE=
X-Google-Smtp-Source: AGHT+IG9gO9hDSEDs9TdXGLVglUNhefZJCU/vSM31F8AZB4cRpN4KdvlB5Qzcbu7EihJSWszmFisKItdNp/FO9jht3A=
X-Received: by 2002:a17:907:d94:b0:ad8:a329:b490 with SMTP id
 a640c23a62f3a-ae3fbc56cbamr223334666b.23.1751631542216; Fri, 04 Jul 2025
 05:19:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250704-rust_add_derive_macro_unit_tests-v1-0-ebd47fa7f78f@linaro.org>
 <aGfKqbywpiZEUr37@intel.com>
In-Reply-To: <aGfKqbywpiZEUr37@intel.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 4 Jul 2025 15:18:18 +0300
X-Gm-Features: Ac12FXwJFj4tmBXIKE-Le9yl85wKgJs-a03DIJc5x9ddVZvMRDKl8DF45VekluM
Message-ID: <CAAjaMXbcMUmdUFMYfiZsygjhrmzKWqBWhdtBwwtt2JgvnrxoKg@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: add Derive macro unit tests
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x535.google.com
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
X-List-Received-Date: Fri, 04 Jul 2025 12:19:12 -0000

On Fri, Jul 4, 2025 at 3:14=E2=80=AFPM Zhao Liu <zhao1.liu@intel.com> wrote=
:
>
> > You can run the added tests directly with this meson command:
> >
> >   meson test rust-qemu-api-macros-tests
>
> Hi Manos, do you meet this error:
>
> Traceback (most recent call last):
>   File "/usr/lib/python3/dist-packages/mesonbuild/mesonmain.py", line 146=
, in run
>     return options.run_func(options)
>   File "/usr/lib/python3/dist-packages/mesonbuild/mtest.py", line 2004, i=
n run
>     b =3D build.load(options.wd)
>   File "/usr/lib/python3/dist-packages/mesonbuild/build.py", line 2868, i=
n load
>     obj =3D pickle.load(f)
> ModuleNotFoundError: No module named 'mesonbuild.options'
>
> ERROR: Unhandled python exception
>
>     This is a Meson bug and should be reported!
> ---
>
> But I've tested this series via `make check`.
>
>
>
>

Sounds like it used your global meson installation instead of the one
from the virtual environment of your build directory.

Thank you for testing!

--=20
Manos Pitsidianakis
Emulation and Virtualization Engineer at Linaro Ltd

