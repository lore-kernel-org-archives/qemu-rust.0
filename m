Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1traQa-00038A-Ux
	for mharc-qemu-rust@gnu.org; Mon, 10 Mar 2025 06:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1traQY-00037H-PO
 for qemu-rust@nongnu.org; Mon, 10 Mar 2025 06:32:06 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1traQW-0001nr-Py
 for qemu-rust@nongnu.org; Mon, 10 Mar 2025 06:32:06 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-e63961ec440so689285276.0
 for <qemu-rust@nongnu.org>; Mon, 10 Mar 2025 03:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741602723; x=1742207523; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kJpDhnofloE+E6zKZqdvAEr5CqPfN+KyQtHOX1ArmcY=;
 b=U1UwWrRUxorA6IZU11jnMLHe/3BLTGU00ou5Pzth5hbqbp/1+QRJNVgasMLCz+joYy
 TtgVS4x1mGcR3NVIcD3x6qS+e6JGZ1tgeSFuhN+IympUlrSu8FABKW7iXjmpjqvkLmcP
 aOe1eolsjlXkyKbD2VutTZkvJA5HiOoHcxiRy2JlL2N4H4TENk1VpZ4wQRqwyoMVYJNo
 DFIlXuqq6BcWVI7OVCsQe+J14gi68ZO9xx1kFHHF3tctwKoAQURwmxL/Z51ZxPX78z9Q
 YasDMxHo/8v34uU6y/RYKV8NN6EM8yHq+86PY3KFcGiHdKSMOa9hYgOpsgbWaUuNBhOT
 vz/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741602723; x=1742207523;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kJpDhnofloE+E6zKZqdvAEr5CqPfN+KyQtHOX1ArmcY=;
 b=YD6ZrVCCWNCEB51Xb6x1ULgtE7sus2ufXLwsR5/37JOxBHXH0HQVpyT4NhrYkgNip6
 eaFJhxX6krDBIsA4mnGUKACSgBcVRzLPM6lxfp2YyecMnaEPha5BcuM7cQUgsFwa9b15
 9KKRc2Po37X3iHxa1ORxzgI6hYvwWcANS/vzVxS9aC2VjgtoHhvQb4IJ6CaKHnWuQ3zG
 x/+fwTjS4Sb38Ut63rn4k3DliSJyy2QA+XD4Jxtog9wxE3RplNq9psoRGhC2GauxvfEd
 ulne0aIWWh3SWPV6x3GZ/I8JDoUZm7pptdbrY9ywCrx6DVNblvTn0DM5FsCYikKIfZ7v
 LaKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuGbVSow3wrOBbRwj5GPdWkYRHQdaomeLF1RuOlVzPJ37660S+RAuzvbyORrh/KQUV5E6De/FjoTo=@nongnu.org
X-Gm-Message-State: AOJu0YyueUAXEaj0ZhiziNOWofDTfdWTxf/ZAcImkfAO7qvKE+iNJfnA
 0Zi1XgoZwA6DqdM3yBVz2YSKQfUPdCjvQFLsDLeuzPKsSprlblDWGwMmxfFA6+PXkn1Xe9EeNh/
 LMs6ck61HiTy+RYtiIvwBkXhXRmoy0zPoJSCP2g==
X-Gm-Gg: ASbGncu418wr6lIM+qkqeHvhG4jvO/7tDioyQ9miUHNZx+lgA2JnrcaJsvzI1h5y95J
 w6YHgFZhnGaYSITcSkh4lQFSA2rktl29bbio0cortd4CHc1V34JKRzzyA1LRyOmA3gBpxMYjCMD
 3f0uHx4Tp83hx3gc9ETQ2TMFnJOszXHVmMXU3xGQ==
X-Google-Smtp-Source: AGHT+IG8Z01w8vvI9FPMsCApAm4JEKCHpiezl2fzFiQsmW+3q6kYJJJ9YEvi0W1cxDtV2hkW2Pg3CnRP7WfOslouavY=
X-Received: by 2002:a05:6902:1684:b0:e5e:23c5:a8c8 with SMTP id
 3f1490d57ef6-e635c177acemr15907161276.22.1741602722863; Mon, 10 Mar 2025
 03:32:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250129082045.1319203-1-pbonzini@redhat.com>
 <CAFEAcA9=G4sdXrxWcmq9wMqu1-ZRNxObQD3hmnFauYwiQr_8YQ@mail.gmail.com>
 <Z86v8Y70sGThWb_V@redhat.com>
 <CABgObfbuj3SbqpDkUnKux1EWCudiksQxbWr_4Sck5tTLr5QqeA@mail.gmail.com>
In-Reply-To: <CABgObfbuj3SbqpDkUnKux1EWCudiksQxbWr_4Sck5tTLr5QqeA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Mar 2025 10:31:51 +0000
X-Gm-Features: AQ5f1JqC_9ULke36BduxV2H9hr_OqCBGORRYJSzaaDZpkNZTulhZhV_rXlQ5UpA
Message-ID: <CAFEAcA8bbXBYy774AMFo=yiRSN4qZnOyaC+sOV0zP11d49mUvg@mail.gmail.com>
Subject: Re: [PATCH] gitlab-ci: include full Rust backtraces in test runs
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org, qemu-rust@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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
X-List-Received-Date: Mon, 10 Mar 2025 10:32:07 -0000

On Mon, 10 Mar 2025 at 09:40, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On Mon, Mar 10, 2025 at 10:25=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrang=
e@redhat.com> wrote:
> > > This will only add the rust backtraces when the tests
> > > are run from the CI logs, not when you locally run
> > > "make check" or similar. There's probably a better place
> > > to put this...
> >
> > Meson's  'test()' command accepts env variables, but it'll be somewhat
> > tedious to add the same env to all case where we use test. Might want
> > to define a common 'testenv' set at the top level meson.build and then
> > reference it from every 'test()', unless meson has built-in support
> > for globally applied env vars that I'm missing.
>
> It can be added to add_test_setup().

Thanks -- I just sent a patch to do it that way:

https://patchew.org/QEMU/20250310102950.3752908-1-peter.maydell@linaro.org/

-- PMM

