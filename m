Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tiwVY-0002aI-Pq
	for mharc-qemu-rust@gnu.org; Fri, 14 Feb 2025 09:17:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tiwVP-0002Tn-8j
 for qemu-rust@nongnu.org; Fri, 14 Feb 2025 09:17:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tiwVM-0004xL-TM
 for qemu-rust@nongnu.org; Fri, 14 Feb 2025 09:17:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739542639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rv2W2LfFlKyt7tQHeo3XVObgcyNEjRJHMjOl/SRINPc=;
 b=G/Gj5A5ZYgQnQUT60K+ZK0OoNBEx0Ql8l5vzB9wNuo8wZ9OZkTFLwq8cQ24aWp7TK10ZU2
 zZ2OzPS338BQRmAEa1EEPoYtR+R719q2Nw8AFtjybDU5AVMfpNODcu7kH4Y+N/JZ1+eqFi
 wlCeXx+nnRcFwlMgmQ8g5y+VC/tg044=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-QqwTnWFFOi6LiHtOa7xGWw-1; Fri, 14 Feb 2025 09:17:17 -0500
X-MC-Unique: QqwTnWFFOi6LiHtOa7xGWw-1
X-Mimecast-MFC-AGG-ID: QqwTnWFFOi6LiHtOa7xGWw_1739542636
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43933b8d9b1so12035905e9.3
 for <qemu-rust@nongnu.org>; Fri, 14 Feb 2025 06:17:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739542635; x=1740147435;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rv2W2LfFlKyt7tQHeo3XVObgcyNEjRJHMjOl/SRINPc=;
 b=ou1XGHqlfGLQUnxfifAW/SAwTqt8wInnSHvJB97WXvXf7GloVxt7ikANcfs/nyGA7G
 liUx1hUwTN1Jg2k4vV6DSTBKIGNZa8YhIa+G48gUdP9TH9aVP7gVRvsMSGQ4Ji0l+o58
 m3Sume7g3VZbsGvS1OsP4dDaqWB7VxDAfciAhhTYaiRUsk5utJzz4J74PtyAI3AEw8TF
 Ainy840tjIpowjP1q8900NHyh4ZL6pDrnTJpaWW0iaRWmXadPV8R4NRipAAYWdNJj7/j
 xfgS59SDgaEeiapQ5ZMvU6uQ3PiGsW2VCWDEOJfpwT2SISqJHhr4ZCMDbhghp6LvQZ32
 W+Ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5YBQvfo2wLQifMisfeqLvdM6+J5kM91LH4aB7p+ntmb3CaTaYYw7bshgUqz69N/dbY4JMfUZirWg=@nongnu.org
X-Gm-Message-State: AOJu0YzoYNrZc98mN2pLJc8zU2ZnjyXFzTjzum8qFlX0sUOg70gzn96z
 U1P+TkoS78yknL0JMfpdf5aVb/JseQBogXpoFGi9xFI4GNEoNpTIMBpuGLyEfDdVfSTo23B6Nes
 Q2EFNU0bU8Iy9qkj9uv0IdUanSsI0NlUj+m52lp3nVdCDTmIMXdZNFtgCQqg6a5xfVKOgqPkX2j
 V8sq1mIDHcvVb2ANUgN+VsvjjtHelbABAB/iXCBcY=
X-Gm-Gg: ASbGnculsz2OaqC8re7Sl9QBP5DP4qselRCGvk9IfXAOpAchqtL3qy1YHuX61O5wmU+
 ix7uzK013KsMDwDpASK3nGfZ4ZQXc2JtImbOu2mWViNIvsTqhuhChqM3zyx9BLkw=
X-Received: by 2002:a05:600c:46cc:b0:439:54d3:d076 with SMTP id
 5b1f17b1804b1-439601694e7mr80498705e9.1.1739542635118; 
 Fri, 14 Feb 2025 06:17:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6G7zw7tqBlE3GAP76Pmg5POhLGPjr3k1mhKuDviOi58LL/EmcL4AZj4MgsjCrExr6r5q63PZQnIUgLobc9HI=
X-Received: by 2002:a05:600c:46cc:b0:439:54d3:d076 with SMTP id
 5b1f17b1804b1-439601694e7mr80498445e9.1.1739542634787; Fri, 14 Feb 2025
 06:17:14 -0800 (PST)
MIME-Version: 1.0
References: <20250214135822.4076174-1-pbonzini@redhat.com>
 <Z69MxsDrLUwOxtuD@redhat.com>
In-Reply-To: <Z69MxsDrLUwOxtuD@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 14 Feb 2025 15:17:02 +0100
X-Gm-Features: AWEUYZliU0-NP3A6tIAeQEr6O2NwqpEc5yXG57IoySb-qyq2namsTE0GyYyUP_g
Message-ID: <CABgObfZg=su=k4T5Xf=cOig7MF7beQ7bof84gUWqpD5-Cv_T9g@mail.gmail.com>
Subject: Re: [PATCH] rust: tests: do not import bindings::*
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k-QnfMBhfQbqDCozDdQP3O6bCGE-3hZcNFgAqWvJlvA_1739542636
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.732,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 14 Feb 2025 14:17:29 -0000

First of all, thanks for taking a look!!

> >      prelude::*,
>
> Should this be expanded too if we want to discourage wildcard imports ?

The prelude is a bit special; it provides a subset of items that most
users will want to include into the namespace. You're right that it
goes against the rule of discouraging wildcard imports, and in fact
that's why it almost entirely consists of extension traits (e.g.
DeviceMethods, SysBusDeviceMethods, ObjectCast, ObjectDeref,
ObjectClassMethods). You shouldn't have to name the traits at all if
the API works, and having them in the prelude lowers the cognitive
load.

There are a few more symbols that are imported in the prelude: for
example the BqlCell and BqlRefCell, the ObjectType and IsA traits, or
the qom_isa macro; those will be used almost everywhere.

The exact shape of the prelude might change in the future, since
qemu_api might get split into separate crates to enable using Rust in
tools (which do not have qdev). For example there could be separate
block, qdev and qom preludes.

In any case, it's an exception and for this reason the amount of
non-extension-traits symbols that it includes should be limited.

> >      qdev::{DeviceClass, DeviceImpl, DeviceState, Property, ResettablePhasesImpl},
> >      qom::{ClassInitImpl, ObjectImpl, ParentField},
> > +    sysbus::SysBusDevice,
>
> This addition seems distinct from the bindings::* removal. Should it
> have been a separate patch ?

SysBusDevice is re-exported from sysbus, similar to DeviceState or
VMStateDescription that you see in the context. This is done because
in general using "bindings" is an anti-pattern; you should use APIs
that have been wrapped properly as is the case for SysBusDevice.

The tests use some "bindings::foo" symbols either because they're
setting up the test environment (module_call_init) or because they're
intentionally bypassing the high-level API (object_new/unref). The
only case where something isn't yet covered by safe wrappers is
qdev_prop_bool.

In fact, a lot of the structs that the tests need were imported twice,
once from bindings and once from e.g. qdev or vmstate. SysBusDevice
was the odd one out that was imported only from bindings, so it has
added.

Paolo

> >      vmstate::VMStateDescription,
> >      zeroable::Zeroable,
> >  };
>
> With regards,
> Daniel


