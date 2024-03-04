<?php

namespace Support\Providers;

use Domain\Auth\Events\UserLoggedEvent;
use Domain\Course\Events\CourseFinishedEvent;
use Domain\Course\Events\Listeners\CourseCheckFinishedListener;
use Domain\Gamification\Events\Listeners\ScoreForCourseFinishedListener;
use Domain\Gamification\Events\Listeners\ScoreForLessonCommentListener;
use Domain\Gamification\Events\Listeners\ScoreForLessonLikedListener;
use Domain\Gamification\Events\Listeners\ScoreForLessonWatchedListener;
use Domain\Gamification\Events\Listeners\ScoreForModuleFinishedListener;
use Domain\Gamification\Events\Listeners\ScoreForUserLoggedListener;
use Domain\Lead\Listeners\SendMessageLeadCreatedListener;
use Domain\Lesson\Events\LessonCommentedEvent;
use Domain\Lesson\Events\LessonFinishedEvent;
use Domain\Lesson\Events\LessonLikedEvent;
use Domain\Lesson\Events\LessonWatchedEvent;
use Domain\Module\Events\Listeners\ModuleCheckFinishedListener;
use Domain\Module\Events\ModuleFinishedEvent;
use Domain\PlatformNotification\Events\PlatformNotificationEvent;
use Domain\PlatformNotification\Listeners\SendPlatformNotificationListener;
use Domain\User\Events\Listeners\NotifyUserCreatedListener;
use Domain\User\Events\Listeners\SubscriptionUserProductsListener;
use Domain\User\Events\UserCreatedEvent;
use Domain\User\Events\UserInviteSubscribedEvent;
use Illuminate\Auth\Events\Registered;
use Illuminate\Auth\Listeners\SendEmailVerificationNotification;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    /**
     * The event to listener mappings for the application.
     *
     * @var array<class-string, array<int, class-string>>
     */
    protected $listen = [
        Registered::class => [
            SendEmailVerificationNotification::class,
        ],
        LessonFinishedEvent::class => [
            ModuleCheckFinishedListener::class,
        ],
        ModuleFinishedEvent::class => [
            CourseCheckFinishedListener::class,
            ScoreForModuleFinishedListener::class,
        ],
        CourseFinishedEvent::class => [
            ScoreForCourseFinishedListener::class,
        ],
        // TODO: Disparar evento de Login (User Logged)
        UserLoggedEvent::class => [
            ScoreForUserLoggedListener::class,
        ],
        // TODO: Disparar evento de Aula Comentada (Lesson Commented)
        LessonCommentedEvent::class => [
            ScoreForLessonCommentListener::class,
        ],
        LessonWatchedEvent::class => [
            ScoreForLessonWatchedListener::class,
        ],
        // TODO: Disparar evento de Aula Curtida (Lesson Liked)
        LessonLikedEvent::class => [
            ScoreForLessonLikedListener::class,
        ],
        UserCreatedEvent::class => [
            NotifyUserCreatedListener::class,
        ],
        UserInviteSubscribedEvent::class => [
            SubscriptionUserProductsListener::class,
        ],
        PlatformNotificationEvent::class => [
            SendPlatformNotificationListener::class,
        ],
        "eloquent.created: Domain\Lead\Models\Lead" => [
            SendMessageLeadCreatedListener::class,
        ]
    ];

    /**
     * Register any events for your application.
     */
    public function boot(): void
    {
        //
    }

    /**
     * Determine if events and listeners should be automatically discovered.
     * Encontra automaticamente seus eventos caso setado true.
     * Não haveria necessidade de resgistrar no $listen, mas teria que lembrar
     */
    public function shouldDiscoverEvents(): bool
    {
        return false;
    }
}
